<%-- 
    Document   : subastaTransporte
    Created on : 08-12-2020, 20:45:36
    Author     : inter
--%>

<%@page import="java.sql.*"%>
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

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Maipo Grande: Administrador</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="principal.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Ingresar nuevos usuarios
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ingresarNuevosUsuarios/agregarClienteExterno.jsp">Cliente externo</a>
                            <a class="dropdown-item" href="ingresarNuevosUsuarios/agregarClienteInterno.jsp">Clientes interno</a>
                            <a class="dropdown-item" href="ingresarNuevosUsuarios/agregarConsultor.jsp">Consultor</a>
                            <a class="dropdown-item" href="ingresarNuevosUsuarios/agregarProductor.jsp">Productor</a>
                            <a class="dropdown-item" href="ingresarNuevosUsuarios/agregarTransportista.jsp">Transportista</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Ver clientes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="listarUsuarios/listarProductor.jsp">Productores</a>
                            <a class="dropdown-item" href="listarUsuarios/listarClienteExterno.jsp">Clientes externos</a>
                            <a class="dropdown-item" href="listarUsuarios/listarClienteInterno.jsp">Clientes internos</a>
                            <a class="dropdown-item" href="listarUsuarios/listarTransportista.jsp">Transportistas</a>
                            <a class="dropdown-item" href="listarUsuarios/listarConsultor.jsp">Consultores</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="controlContratos.jsp">Controlar contratos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ingresarSaldo.jsp">Agregar saldo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listadoSolicitudProductos.jsp">Solicitud de productos</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Participantes de subastas
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="listadoParticipantes.jsp">Productores</a>
                            <a class="dropdown-item" href="subastaTransporte.jsp">Transportistas</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listarPedidos.jsp">Pedidos</a>
                    </li>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AnimFolder/CorreoLoading.jsp">Correo</a>
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
            <h1 style="    font-size: 20px;
                font-family: 'Open Sans', Helvetica, Arial, sans-serif;
                text-align: left;
                margin-top: 30px;
                font-weight: bold;
                margin-left: 30px;">Listado participantes transportistas</h1>

            <table class="content-table">
                <thead>
                    <tr>
                        <th>Codigo del pedido</th>
                        <th>Rut solicitante</th>
                        <th>Titulo</th>
                        <th>Descripcion</th>
                        <th>Region de entrega</th>
                        <th>Comuna de entrega</th>
                        <th>Estado de entrega</th>
                        <th>Productor a cargo</th>
                        <th>Dinero de entrega</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String pedidosquery = "SELECT p.id_pedido, p.rut_solicitante, p.titulo, p.descripcion, r.nombre_region, c.nombre_comuna, p.dinero_maximo, p.estado_pedido, p.rut_productor FROM PEDIDOS P JOIN REGION R ON r.id_region = p.region JOIN COMUNA C ON c.id_comuna = p.comuna WHERE ESTADO_PEDIDO = 'En proceso'";
                        ps = cn.prepareStatement(pedidosquery);
                        rs = ps.executeQuery();
                        while (rs.next() == true) {
                    %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(9)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><a href="transportistaFiles/postulantesSubasta.jsp?id=<%=rs.getString(1)%>">Postulantes</a></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </form>
    </body>
</html>
