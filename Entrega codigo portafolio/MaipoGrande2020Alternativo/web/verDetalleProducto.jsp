<%-- 
    Document   : verDetalleProducto
    Created on : 30-10-2020, 18:14:48
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
        <form action="addCartProducto" method="post" class="form"> 
            <h2>Detalle del producto </h2>
            <br><br>
        <%
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "ADMIN";
            String pass = "123";
            Class.forName(driver);
            Connection cn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            cn = DriverManager.getConnection(url,user,pass);
            Statement st = null;
            HttpSession sesion = request.getSession();
            String user_http;
            String id = request.getParameter("id");
            String sql_compra = "SELECT * FROM producto_publicado WHERE ID_PUBLICACION = "+id+"";
            ps = cn.prepareStatement(sql_compra);
            rs = ps.executeQuery();
            while (rs.next()==true) {                    
        %>
        Nombre del producto
        <input type="text" name="txtProducto" value="<%=rs.getString(4)%>">
        <br><br>
        Peso del producto (KG)
        <input type="text" name="txtPeso" value="<%=rs.getString(5)%>">
        <br><br>
        Precio del producto (CLP)
        <input type="text" name="txtPrecio" value="<%=rs.getString(6)%>">
        <br><br>
        Nombre del vendedor
        <input type="text" name="txtNomVendedor" value="<%=rs.getString(3)%>">
        <input type="hidden" name="txtRut" value="<%=rs.getString(2)%>">
        <input type="hidden" name="txtVenta" value="<%=rs.getString(1)%>">
        <br><br><br>
        <%
        }
        %>
        <button type="submit" name="btnCarro"> Agregar al carro</button>
        <br> <br>
        <button><a style="text-decoration: none; color: #000" href="javascript: window.history.go(-1);">Volver atras</a></button>
        </form>
    </body>
</html>
