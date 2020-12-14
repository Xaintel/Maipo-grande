<%-- 
    Document   : listarSaldos
    Created on : 11-12-2020, 13:06:46
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>     
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="css/subastacss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Maipo Grande: Cliente interno</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="ClienteInterno.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="realizarComprasInterno.jsp">Nuestros productos<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="listarSaldos.jsp">Realizar compras de saldos <span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="AnimFolder/CorreoLoading.jsp">Correo<span class="sr-only"></span></a>
                    </li>  

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <%
                        HttpSession sesion = request.getSession();
                        String user_http;
                        String pass_http;

                        if (sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null) {
                            user_http = sesion.getAttribute("user").toString();
                            pass_http = sesion.getAttribute("pass").toString();
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

        <form>
            <%                String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = DriverManager.getConnection(url, user, pass);
                PreparedStatement ps = null;
                ResultSet rs = null;
                Statement st = null;
            %>
            <table class="content-table">
                <thead>
                    <tr>
                        <th>Nombre del producto</th>
                        <th>Precio del producto</th>
                        <th>Peso del producto</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String listsaldo = "SELECT s.id_saldo,p.nombre_producto, s.precio_producto, s.peso_producto \n"
                                + "FROM SALDOS S \n"
                                + "JOIN PRODUCTO P ON p.id_producto = s.id_producto \n"
                                + "where s.estado_compra = 'NO'";
                        ps = cn.prepareStatement(listsaldo);
                        rs = ps.executeQuery();
                        while (rs.next()==true) {
                    %>
                    <tr>
                        <td><%=rs.getString(2)%></td>
                        <td>$ <%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%> KG</td>
                        <td><a href="compraSaldo/compraSaldo.jsp?cod=<%=rs.getString(1)%>">Comprar</a></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </form>
    </body>
</html>
