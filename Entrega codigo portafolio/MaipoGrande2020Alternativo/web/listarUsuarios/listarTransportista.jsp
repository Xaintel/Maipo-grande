<%-- 
    Document   : listarTransportista
    Created on : 25-09-2020, 1:51:33
    Author     : inter
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        <link href="../css/tablesCss.css" rel="stylesheet" type="text/css"/>
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
                        <a class="nav-link" href="../principal.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Ingresar nuevos usuarios
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="../ingresarNuevosUsuarios/agregarClienteExterno.jsp">Cliente externo</a>
                            <a class="dropdown-item" href="../ingresarNuevosUsuarios/agregarClienteInterno.jsp">Clientes interno</a>
                            <a class="dropdown-item" href="../ingresarNuevosUsuarios/agregarConsultor.jsp">Consultor</a>
                            <a class="dropdown-item" href="../ingresarNuevosUsuarios/agregarProductor.jsp">Productor</a>
                            <a class="dropdown-item" href="../ingresarNuevosUsuarios/agregarTransportista.jsp">Transportista</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Ver clientes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="../listarUsuarios/listarProductor.jsp">Productores</a>
                            <a class="dropdown-item" href="../listarUsuarios/listarClienteExterno.jsp">Clientes externos</a>
                            <a class="dropdown-item" href="../listarUsuarios/listarClienteInterno.jsp">Clientes internos</a>
                            <a class="dropdown-item" href="../listarUsuarios/listarTransportista.jsp">Transportistas</a>
                            <a class="dropdown-item" href="../listarUsuarios/listarConsultor.jsp">Consultores</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../controlContratos.jsp">Controlar contratos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../ingresarSaldo.jsp">Agregar saldo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../listadoSolicitudProductos.jsp">Solicitud de productos</a>
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
                        <a class="nav-link" href="../listarPedidos.jsp">Pedidos</a>
                    </li>  
                    <li class="nav-item">
                        <a class="nav-link" href="../AnimFolder/CorreoLoading.jsp">Correo</a>
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
                    <a href="../logOut.jsp" style="color: #000; text-decoration: none">Cerrar sesion </a>
                    <%
                        } else {
                            out.print("<script> location.replace('../index.jsp'); </script>");
                        }


                    %>
                </form>
            </div>
        </nav>

        <h1>Listado Transportistas </h1>

        <table class="content-table">
            <thead>
                <tr>
                    <th>Rut usuario</th>
                    <th>Nombre usuario</th>
                    <th>Nombre completo</th>
                    <th>Direccion</th>
                    <th>Comuna</th>
                    <th>Region</th>
                    <th>Telefono</th>
                    <th>Correo</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>

                </tr>
            </thead>
            <tbody>
                <%                    String driver = "oracle.jdbc.OracleDriver";
                    String url = "jdbc:oracle:thin:@localhost:1521/XE";
                    String user = "ADMIN";
                    String pass = "123";
                    Class.forName(driver);
                    String sql = "SELECT u.rut_usuario, u.nombre_usuario,(u.NOMBRE || ' ' || u.APELLIDO_PATERNO || ' ' || u.APELLIDO_MATERNO) AS NOMBRE_COMPLETO, u.direccion, c.nombre_comuna, r.nombre_region, u.telefono_celular , u.correo_electronico \n"
                            + "FROM usuario u \n"
                            + "join comuna c on c.id_comuna = u.id_comuna \n"
                            + "join region r on r.id_region = u.id_region \n"
                            + "WHERE u.id_rol = 5 ";
                    Connection cn = DriverManager.getConnection(url, user, pass);
                    PreparedStatement ps = cn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();

                %>
                <%                    //ResultSet rs = null;
                    Statement st = null;
                    try {
                        st = cn.createStatement();
                        //rs=st.executeQuery("select*from estado_producto;");

                        while (rs.next()) {
                %>
                <tr class="active-row">
                    <th><%=rs.getString(1)%></th>
                    <th><%=rs.getString(2)%></th>
                    <th><%=rs.getString(3)%></th>
                    <th><%=rs.getString(4)%></th>
                    <th><%=rs.getString(5)%></th>
                    <th><%=rs.getString(6)%></th>
                    <th><%=rs.getString(7)%></th>
                    <th><%=rs.getString(8)%></th>
                    <td><a type="submit" href="../modificarUsuario.jsp?rut=<%=rs.getString(1)%>">Modificar</a></td>
                    <td><a type="submit" href="../borrarUsuario.jsp?rut=<%=rs.getString(1)%>">Eliminar</a></td>
                </tr>


                <%

                        }
                        st.close();
                        rs.close();
                        cn.close();

                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }
                %>   
            </tbody>
        </table>
    </body>
</html>
