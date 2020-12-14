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
                rut = document.getElementById("rut").value;
                clave = document.getElementById("pass").value;

                if (rut.length >= 8 && clave.length > 0) {
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
                <img src="../img/debito.png" height="150px" width="200px" style="float: right; margin-right: 20px">
                <input style="display: none"type="text" name="txtpago" value="<%=rs.getString(3)%>"> 

                <br>

                <a style="font-weight: bold; font-size: 25px">Pago realizado por MaipoPay.</a>
                <br><br>
                <a style="font-size: 20px">El pago a realizar es de: $ <%=rs.getString(3)%></a>
                <br><br>
            </div>
            <br><br>
            <%
                }
            %>
            <a>Seleccione su banco</a>
            <select id="banco" name="cbxBanco">
                <option value="0" id="valuezero">Seleccione banco</option>
                <option value="BANCO SANTANDER">BANCO SANTANDER</option>
                <option value="BANCO SANTANDER BANEFE">BANCO SANTANDER BANEFE</option>
                <option value="BANCO ITAU">BANCO ITAU</option>
                <option value="BCI-TBANC">BCI-TBANC</option>
                <option value="BANCO FALABELLA">BANCO FALABELLA</option>
                <option value="CORPBANCA">CORPBANCA</option>
                <option value="BANCO DE CHILE">BANCO DE CHILE/ EDWARDS CITI</option>
                <option value="BANCO ESTADO">BANCO ESTADO</option>
                <option value="BANCO BICE">BANCO BICE </option>
                <option value="BANCO SECURITY">BANCO SECURITY</option>
                <option value="BANCO CONSORCIO">BANCO CONSORCIO</option>
                <option value="BANCO RIPLEY">BANCO RIPLEY</option>
                <option value="BANCO INTERNACIONAL">BANCO INTERNACIONAL</option>
                <option value="SCOTIABANK">SCOTIABANK</option>
                <option value="COOPEUCH">COOPEUCH</option>
            </select>
            <br><br>
            <button type="button" style="margin-top: 350px" onclick="validation1()" id="btn1" >Continuar </button>
            <div id="secondphase" style="display: none">
                <br><br>
                <a>Ingrese su rut</a>
                <input type="number" name="txtrut" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="rut" placeholder="Ingrese su rut sin guion, ni puntos. Ejemplo (159033517)" maxlength="9">
                <br><br><br>
                <a>Ingrese su clave</a>
                <input type="password" name="txtpass" id="pass">

                <button type="button" style="margin-top: 210px" onclick="validation2()" id="btn2">Pagar</button>
            </div>
            <input style="display: none" type="submit" id="pagar" name="btnComprar" value="Pagar">
        </form>
        <div class="img">
            <img src="../img/pago-background.jpg" width="400px" height="720px" style="float: right; margin-top: 30px; margin-right: 522px;">
        </div>
        <%
            if (request.getParameter("btnComprar") != null) {
                String rutcliente = request.getParameter("txtrutcliente");
                String banco = request.getParameter("cbxBanco");
                String rut = request.getParameter("txtrut");
                String idsaldo = request.getParameter("txtidsaldo");
                String pago = request.getParameter("txtpago");
                try {
                    st = cn.createStatement();
                    String insertdebito = "INSERT INTO REGISTRO_VENTA_SALDOS \n "
                            + "VALUES (SEQ_VENTA_SALDO.nextval, '" + idsaldo + "', '" + rutcliente + "',(SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL),'DEBITO','" + banco + "','" + rut + "',NULL,'" + pago + "')";
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
