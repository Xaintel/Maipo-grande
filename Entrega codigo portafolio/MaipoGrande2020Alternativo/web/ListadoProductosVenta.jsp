<%-- 
    Document   : ListadoProductosVenta
    Created on : 27-10-2020, 18:04:56
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
        <link href="css/tablesCss.css" rel="stylesheet" type="text/css"/>
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

        <form>
            <%                String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                Statement st = null;
                cn = DriverManager.getConnection(url, user, pass);
                String rut_list = request.getParameter("rut");

            %>
            <table class="content-table">
                <thead>
                    <tr>
                        <th>Rut de productor</th>
                        <th>Nombre usuario</th>
                        <th>Producto</th>
                        <th>Peso</th>
                        <th>Precio</th>
                        <th>Estado</th>
                        <th></th>

                    </tr>
                </thead>
                <tbody>
                    <%                        
                        String sql_producto = "select pv.cod_venta, pv.rut_usuario, pv.nombre_productor, p.nombre_producto, pv.peso_producto, pv.precio_producto, e.nombre_estado, u.nombre_usuario, u.correo_electronico from PRODUCTO_VENTA pv join producto p on p.id_producto = pv.id_producto join estado_producto e on e.id_estado = pv.id_estado join usuario u on u.rut_usuario = pv.rut_usuario where pv.rut_usuario = " + rut_list + " and APROBACION_PARA_VENTA = 'NO'";
                        ps = cn.prepareStatement(sql_producto);
                        rs = ps.executeQuery();
                        while (rs.next() == true) {
                    %>
                    <tr>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                <input type="text" style="display: none" name="txtidventa" value="<%=rs.getString(1)%>">
                <input type="text" style="display: none" name="txtRut" readonly="" value="<%=rs.getString(2)%>">
                <input type="text" style="display: none" name="txtUsuario" readonly="" value="<%=rs.getString(3)%>">
                <input type="text" style="display: none" name="txtProducto" readonly="" value="<%=rs.getString(4)%>">
                <input type="text" style="display: none" name="txtPeso" readonly="" value="<%=rs.getString(5)%>">
                <input type="text" style="display: none" name="txtPrecio" readonly="" value="<%=rs.getString(6)%>">
                <input type="text" style="display: none" name="txtEstado" readonly="" value="<%=rs.getString(7)%>">
                <input type="text" style="display: none" name="txtUserName" readonly="" value="<%=rs.getString(8)%>">
                <input type="text" style="display: none" name="txtEmail" readonly="" value="<%=rs.getString(9)%>">
                <td><input type="submit" name="btnAgregar" value="AGREGAR"></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>

        </form>

        <%
            if (request.getParameter("btnAgregar") != null) {
                String idventa = request.getParameter("txtidventa");
                int rut = Integer.parseInt(request.getParameter("txtRut"));
                String usuario = request.getParameter("txtUsuario");
                String producto = request.getParameter("txtProducto");
                int peso = Integer.parseInt(request.getParameter("txtPeso"));
                int precio = Integer.parseInt(request.getParameter("txtPrecio"));
                String estado = request.getParameter("txtEstado");
                String username = request.getParameter("txtUserName");
                String email = request.getParameter("txtEmail");

                try {
                    st = cn.createStatement();
                    String updateproducto = "UPDATE PRODUCTO_VENTA SET APROBACION_PARA_VENTA = 'SI' WHERE COD_VENTA = '"+idventa+"'";
                    String correoInsert = "INSERT INTO CORREO \n "
                            + "VALUES (SEQ_CORREO.nextval,'SISTEMA','" + username + "','SYSTEM-MAIL-DO-NOT-REPLY@SYSTEM','" + email + "','Validacion de producto para la venta','El producto: " + producto + " con el precio de $ " + precio + " ha sido verificado y permitido para la venta, este ya se encuentra disponible y se le informara mediante correo electronico cuando un cliente haya comprado su producto.',(SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL),(SELECT TO_CHAR(SYSDATE, 'HH24:MI') FROM DUAL),'NO')";

                    st.executeUpdate(updateproducto);
                    st.executeUpdate(correoInsert);
                    response.sendRedirect("listadoSolicitudProductos.jsp");
                } catch (Exception e) {
                    out.print("Error" + e.getMessage());
                }
            }

        %>
    </body>
</html>
