<%-- 
    Document   : ventaProducto
    Created on : 20-10-2020, 17:40:13
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            function  validacion(){
                rut = document.getElementById("rut").value;
                producto = document.getElementById("producto").value;
                estado = document.getElementById("estado").value;
                peso = document.getElementById("peso").value;
                precio = document.getElementById("precio").value;
                
                if(rut.length >= 8 && producto != 0 && estado != 0 && peso.length > 0 && precio.length > 0){
                    document.getElementById("agregar").click();
                    document.getElementById("errormessage").style.display = "none";
                }else{
                    document.getElementById("errormessage").style.display = "block";
                }
            }
        </script>
        <%
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "ADMIN";
            String pass = "123";
            Class.forName(driver);
            Connection cn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            cn = DriverManager.getConnection(url, user, pass);
            String cod = request.getParameter("cod");
            String desc = request.getParameter("desc");
            HttpSession sesion = request.getSession();
            String user_http;
            if (sesion.getAttribute("user") == null && sesion.getAttribute("pass") == null) {
                out.print("<script> location.replace('index.jsp'); </script>");
            }

        %>

        <!-- ID_PROCESO -->
        <form action="addCart" method="post" class="form">
            <%            String sql = "SELECT MAX(id_proceso)+1 FROM detalle_proceso_venta";
                ps = cn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next() == true) {

            %>
            <input type="hidden" name="txtIdProducto" value="<%=rs.getString(1)%>" >
            <%
                }
            %>
            <!-- ID_VENTA -->
            <input type="hidden" name="txtIdVenta" value="<%=cod%>">


            <h2> Participacion proceso </h2>
            <br>
            <p> Solicitud: <%=desc%></p>
            <br<br><br>
            <%
                if (sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null) {
                    user_http = sesion.getAttribute("user").toString();
                    String query = "SELECT RUT_USUARIO FROM USUARIO WHERE NOMBRE_USUARIO = '" + user_http + "'";
                    ps = cn.prepareStatement(query);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
            %>
            Rut usuario
            <input type="text" name="txtRut" value="<%=rs.getString(1)%>" id="rut">
            <br><br>
            <%
                    }
                }
            %>
            Nombre producto
            <select name="txtNombre" id="producto">
                <option value="0">-Seleccionar-</option>
                <%
                    String query_prod = "Select * from producto ORDER BY NOMBRE_PRODUCTO";
                    ps = cn.prepareCall(query_prod);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {

                %>
                <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                <%
                    }
                %>
            </select>
            <br><br>
            Estado producto
            <select name="cbxEstado" id="estado">
                <option value="0">--SELECCIONE --</option>
                <%
                    String cal = "SELECT * FROM ESTADO_PRODUCTO";
                    ps = cn.prepareStatement(cal);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {

                %>
                <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%> </option>
                <%}%>
            </select>

            <br><br>
            Peso
            <input type="number" name="txtPeso" id="peso">
            <br><br>
            Precio
            <input type="number" name="txtPrecio" id="precio">
            <br><br>
            <button type="button" onclick="validacion()">Agregar</button>
            <button type="submit" id="agregar" name="btnParticipar" style="display: none">Agregar</button>
            <br><br>
            <a style="color: red; font-weight: bold; margin-left: 120px; display: none" id="errormessage">Los campos no estan completos!</a>

        </form>


        <script type="text/javascript" 
                src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
        </script>
    </body>
</html>
