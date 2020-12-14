<%-- 
    Document   : modificarUsuario
    Created on : 30-10-2020, 20:18:57
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

        <%            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "ADMIN";
            String pass = "123";
            Class.forName(driver);
            Connection cn = DriverManager.getConnection(url, user, pass);
            String rut = request.getParameter("rut");
            PreparedStatement ps = null;
            ResultSet rs = null;
            String sql_usuario = "SELECT * FROM USUARIO WHERE RUT_USUARIO = " + rut + "";
            ps = cn.prepareStatement(sql_usuario);
            rs = ps.executeQuery();
            while (rs.next() == true) {
        %>
        <form class="form">
            <h2>Modificar usuario</h2>
            <br><br>
            Rut usuario
            <input type="text" name="txtRut" value="<%=rs.getString(1)%>">
            <br><br>
            Nombre de usuario
            <input type="text" name="txtNomUsuario" value="<%=rs.getString(2)%>">
            <br><br>
            Contraseña del usuario
            <input type="password" name="txtClave" value="<%=rs.getString(3)%>">
            <br><br>
            Primer nombre
            <input type="text" name="txtNombre" value="<%=rs.getString(4)%>">
            <br><br>
            Apellido Paterno
            <input type="text" name="txtApellidoPaterno" value="<%=rs.getString(5)%>">
            <br><br>
            Apellido Materno
            <input type="text" name="txtApellidoMaterno" value="<%=rs.getString(6)%>">
            <br><br>
            Direccion
            <input type="text" name="txtDireccion" value="<%=rs.getString(7)%>">
            <br><br>
            Telefono
            <input type="text" name="txtTelefono" value="<%=rs.getString(10)%>">
            <br><br>
            Correo electronico
            <input type="text" name="txtCorreo" value="<%=rs.getString(11)%>">
            <br><br>
            Region
            <select name="cbxRegion">
                <%
                    String sql_user_region = "select U.RUT_USUARIO, u.id_region, r.nombre_region from usuario U join region r on r.id_region = u.id_region WHERE u.RUT_USUARIO = " + rut + " ";
                    ps = cn.prepareStatement(sql_user_region);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(2)%>"><%=rs.getString(3)%></option>
                <%
                    }
                %>
                <%
                    String sql_region = "SELECT * FROM REGION";
                    ps = cn.prepareStatement(sql_region);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                <% } %>
            </select>
            <br><br>
            Comuna
            <select name="cbxComuna">

                <%
                    String sql_user_comuna = "select u.rut_usuario, u.id_region, c.nombre_comuna from usuario U JOIN comuna c on c.id_comuna = u.id_comuna WHERE u.rut_usuario = " + rut + "";
                    ps = cn.prepareStatement(sql_user_comuna);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(2)%>"><%=rs.getString(3)%></option>
                <% } %>
                <%
                    String sql_comuna = "SELECT * FROM COMUNA";
                    ps = cn.prepareStatement(sql_comuna);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                <% } %>
            </select>
            <br><br><br>
            <button type="submit" name="btnModificar">Modificar </button>
            <br>
            <button><a href="javascript: window.history.go(-1);" style="text-decoration: none; color: black;">Volver</a></button>

        </form> 
        <%}%>

        <%
            if (request.getParameter("btnModificar") != null) {
                String rut_usuario = request.getParameter("txtRut");
                String nombreusuario = request.getParameter("txtNomUsuario");
                String clave = request.getParameter("txtClave");
                String nombre = request.getParameter("txtNombre");
                String apellidopaterno = request.getParameter("txtApellidoPaterno");
                String apellidomaterno = request.getParameter("txtApellidoMaterno");
                String direccion = request.getParameter("txtDireccion");
                int telefono = Integer.parseInt(request.getParameter("txtTelefono"));
                String correo = request.getParameter("txtCorreo");
                int region = Integer.parseInt(request.getParameter("cbxRegion"));
                int comuna = Integer.parseInt(request.getParameter("cbxComuna"));

                Statement st = null;
                try {
                    st = cn.createStatement();
                    String update = "UPDATE USUARIO \n"
                            + "SET NOMBRE_USUARIO = '" + nombreusuario + "', CONTRASENIA = '" + clave + "', NOMBRE = '" + nombre + "', APELLIDO_PATERNO = '" + apellidopaterno + "', APELLIDO_MATERNO = '" + apellidomaterno + "', DIRECCION = '" + direccion + "', ID_REGION = " + region + ", ID_COMUNA = " + comuna + ", telefono_celular = " + telefono + ", CORREO_ELECTRONICO = '" + correo + "' \n"
                            + "WHERE RUT_USUARIO = " + rut_usuario + "";
                    st.executeUpdate(update);
                    out.print("los datos han sido actualizados correctamente");
                } catch (Exception e) {
                    e.getMessage();
                }
            }

        %>
    </body>
</html>
