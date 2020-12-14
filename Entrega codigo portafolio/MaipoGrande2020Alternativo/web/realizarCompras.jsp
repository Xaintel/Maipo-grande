<%-- 
    Document   : realizarCompras
    Created on : 28-10-2020, 18:54:33
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/tablesCss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>

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
            HttpSession sesion = request.getSession();
            String user_http;
            String pass_http;
            user_http = sesion.getAttribute("user").toString();
        %>
        <!-- Display externo screen  -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Maipo Grande: Cliente Externo</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="ClienteExterno.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="realizarCompras.jsp">Nuestros productos<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="realizarPedido.jsp">Realizar pedido<span class="sr-only"></span></a>
                    </li>
                    <%
                        String runuser = "Select * from usuario where nombre_usuario = '" + user_http + "'";
                        ps = cn.prepareStatement(runuser);
                        rs = ps.executeQuery();
                        while (rs.next() == true) {
                    %> 
                    <li class="nav-item active">
                        <a class="nav-link" href="estadoPedido.jsp?run=<%=rs.getString(1)%>">Estado de pedido<span class="sr-only"></span></a>
                    </li>
                    <%
                        }
                    %>
                    <li class="nav-item active">
                        <a class="nav-link" href="AnimFolder/CorreoLoading.jsp">Correo<span class="sr-only"></span></a>
                    </li>  
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <%
                        if (sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null) {
                            user = sesion.getAttribute("user").toString();
                            pass = sesion.getAttribute("pass").toString();
                    %>
                    <a href="logOut.jsp" style="color: #000; text-decoration: none">Cerrar sesion </a>
                    <%
                        } else {
                            out.print("<script> location.replace('index.jsp'); </script>");
                        }


                    %>
                </form>
            </div>
        </nav>
    </div>
    <form>
        <table class="content-table">
            <thead>
                <tr>
                    <th>Nombre del producto</th>
                    <th>Peso de producto</th>
                    <th>Precio</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>                    <%                String sql_compra = "SELECT P.NOMBRE_PRODUCTO, PV.PESO_PRODUCTO, PV.PRECIO_PRODUCTO, PV.COD_VENTA FROM PRODUCTO_VENTA PV \n "
                        + "JOIN PRODUCTO P ON P.ID_PRODUCTO = pv.id_producto \n "
                        + "WHERE ID_ESTADO >=2 AND COMPRADO = 'NO'";
                ps = cn.prepareStatement(sql_compra);
                rs = ps.executeQuery();
                while (rs.next() == true) {
                %>
                <tr>

                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><a href="compraproductos/compraProductos.jsp?cod=<%=rs.getString(4)%>">Comprar</a></td>

                </tr>
                <%}%>
            </tbody>
        </table>
    </form>
</body>
</html>
