<%-- 
    Document   : Pagodebito
    Created on : 11-12-2020, 18:38:43
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/pagocss.css" rel="stylesheet" type="text/css"/>
    </head>
    <script type="text/javascript">
    </script> 
    <body>
        <script>
            function validation1() {
                banco = document.getElementById("banco").value;

                if (banco != "0") {
                    document.getElementById("secondphase").style.display = "block";
                    document.getElementById("errormsg1").style.display = "none";
                    document.getElementById("btn1").style.display = "none";
                } else {
                    document.getElementById("errormsg1").style.display = "block";
                }
            }

            function validation2() {
                tarjeta = document.getElementById("tarjeta").value;
                fecha = document.getElementById("fecha").value;
                clave = document.getElementById("pass").value;

                if (tarjeta.length == 16 && fecha != 0 && clave.length == 3) {
                    document.getElementById("pagar").click();
                } else {
                    document.getElementById("errormsg2").style.display = "block";
                }
            }
        </script>
        <div class="alert" id="errormsg1" style="display: none; font-size: 20px;">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            ERROR: No hay un banco seleccionado!
        </div> 
        <div class="alert" id="errormsg2" style="display: none; font-size: 20px;">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            Error: Los campos no pueden estar vacios!
        </div> 
        <form class="container">
            <%
                String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = DriverManager.getConnection(url, user, pass);
                PreparedStatement ps = null;
                ResultSet rs = null;
                Statement st = null;
                String codigo = request.getParameter("cod");
                HttpSession sesion = request.getSession();
                String user_http;
                String pass_http;
                user_http = sesion.getAttribute("user").toString();
            %>
            <h1>Centro de pago</h1>
            <%
                String rutclienteinterno = "SELECT * FROM USUARIO WHERE NOMBRE_USUARIO = '" + user_http + "'";
                ps = cn.prepareStatement(rutclienteinterno);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <input type="text" style="display: none" name="txtrutcliente" value="<%=rs.getString(1)%>">
            <%
                }
            %>

            <input type="text" style="display: none" name="txtidsaldo" value="<%=codigo%>"> 
            <%
                String saldosql = "SELECT * FROM SALDOS WHERE ID_SALDO = " + codigo + "";
                ps = cn.prepareStatement(saldosql);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <div style="border-bottom: 2px solid black"> 
                <input style="display: none"type="text" name="txtpago" value="<%=rs.getString(3)%>"> 
                <br>
                <img src="../img/visalogo.png" height="80px" width="80px" style="float: right; margin-right: 20px">
                <a style="font-weight: bold; font-size: 25px">Pago realizado por MaipoPay.</a>
                <br><br>
                <a style="font-size: 20px">El pago a realizar es de: $ <%=rs.getString(3)%> con credito</a>
                <br><br>
            </div>
            <br><br>
            <%
                }
            %>
            <a>Seleccione su banco</a>
            <select id="banco" name="cbxBanco">
                <option value="0" id="value0">Seleccione</option>
                <option value="VISA">VISA</option>
                <option value="MASTERCARD">MASTERCARD</option>
                <option value="AMERICAN EXPRESS">AMERICAN EXPRESS</option>
                <option value="DINNERS CLUB INTERNATIONAL">DINNERS CLUB INTERNATIONAL</option>
                <option value="MAGNA">MAGNA</option>
            </select>
            <br><br>
            <button type="button" style="margin-top: 350px" onclick="validation1()" id="btn1" >Continuar </button>
            <div id="secondphase" style="display: none">
                <br><br>
                <a>Ingrese numero de tarjeta</a>
                <input type="number" name="txttarjeta" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="tarjeta" placeholder="Ingrese los numeros de su tarjeta(XXXX XXXX XXXX XXXX)" maxlength="16">
                <br><br><br>
                <a>Fecha de vencimiento</a>
                <input type="month" name="txtFecha" id="fecha" >
                <br><br><br>
                <a>Codigo de seguridad</a>
                <input type="password" name="txtpass" placeholder="3 ultimos digitos" maxlength="3" id="pass">

                <button type="button" style="margin-top: 137px" onclick="validation2()" id="btn2">Pagar</button>
            </div>
            <input style="display: none" type="submit" id="pagar" name="btnComprar" >
        </form>
        <div class="img">
            <img src="../img/paymentbackground.jpg" width="400px" height="720px" style="float: right; margin-top: 30px; margin-right: 522px;">
        </div>
        <%
            if (request.getParameter("btnComprar") != null) {
                String rutcliente = request.getParameter("txtrutcliente");
                String banco = request.getParameter("cbxBanco");
                String tarjeta = request.getParameter("txttarjeta");
                String idsaldo = request.getParameter("txtidsaldo");
                String pago = request.getParameter("txtpago");
                try {
                    st = cn.createStatement();
                    String insertdebito = "INSERT INTO REGISTRO_VENTA_SALDOS \n "
                            + "VALUES (SEQ_VENTA_SALDO.nextval, '" + idsaldo + "', '" + rutcliente + "',(SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL),'DEBITO','" + banco + "',NULL,'" + tarjeta + "','" + pago + "')";
                    String updatesaldo = "UPDATE SALDOS SET ESTADO_COMPRA = 'SI' WHERE ID_SALDO = '" + idsaldo + "'";
                    st.executeUpdate(insertdebito);
                    st.executeUpdate(updatesaldo);
                    response.sendRedirect("loading.jsp");
                } catch (Exception e) {
                    out.print("Error al ingresar el pago");
                }
            }
        %>
        <script type="text/javascript" 
                src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
        </script>
    </body>
</html>
