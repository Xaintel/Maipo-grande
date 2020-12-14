<%-- 
    Document   : estadoPedido
    Created on : 09-12-2020, 15:10:47
    Author     : inter
--%>
<%@page import="java.sql.*"%>
<!--SELECT * FROM PEDIDOS WHERE RUT_SOLICITANTE  = 20318928-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/subastacss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
        <script>
            setTimeout(function () {
                ShowNav();
            }, 0000);

            function  ShowNav() {
                var str = document.getElementById("role").value;

                switch (str) {
                    case "3":
                        document.getElementById("1").style.display = "block";
                        break;
                    case "6":
                        document.getElementById("3").style.display = "block";
                    default :
                        break;
                }
            }

        </script>

        <!-- Barra de navegacion --> 

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
        <div style="display: none" id="1">
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
        <!-- Display consultor screen  -->
        <div style="display: none" id="3">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">Maipo Grande: Comerciante</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="realizarPedido.jsp">Realizar pedido <span class="sr-only"></span></a>
                        </li>
                        <%                            String runuser1 = "Select * from usuario where nombre_usuario = '" + user_http + "'";
                            ps = cn.prepareStatement(runuser1);
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
                        <%                        if (sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null) {
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

        </div>
        <!-- Fin barra de navegacion -->
        <form>
            <h1>Estado de sus pedidos</h1>
            <%                user_http = sesion.getAttribute("user").toString();
                String runuser3 = request.getParameter("run");
            %>
            <%
                String sql_rut = "SELECT * FROM USUARIO WHERE NOMBRE_USUARIO = '" + user_http + "'";
                ps = cn.prepareStatement(sql_rut);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <input type="text" name="txtRole" id="role" hidden="" value="<%=rs.getString(12)%>">
            <%}%>
            <table class="content-table">
                <thead>
                    <tr>
                        <th>Cod de su pedido</th>
                        <th>Descripcion de su pedido</th>
                        <th>Region de entrega</th>
                        <th>Comuna de entrega</th>
                        <th>Estado del pedido</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String pedidocheck = "SELECT p.id_pedido, p.descripcion, r.nombre_region, c.nombre_comuna, p.estado_pedido FROM PEDIDOS P \n"
                                + "JOIN COMUNA C ON C.ID_COMUNA = P.COMUNA \n"
                                + "JOIN REGION R ON R.ID_REGION = P.REGION \n"
                                + "WHERE p.RUT_SOLICITANTE = " + runuser3 + "";
                        ps = cn.prepareStatement(pedidocheck);
                        rs = ps.executeQuery();
                        while (rs.next() == true) {
                    %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </form>
        <script type="text/javascript" 
                src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
        </script>
    </body>
</html>
