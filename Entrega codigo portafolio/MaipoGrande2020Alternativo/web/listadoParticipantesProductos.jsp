<%-- 
    Document   : listadoParticipantesProductos
    Created on : 01-11-2020, 22:36:09
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/tablesCss.css" rel="stylesheet" type="text/css"/>
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
                    <li class="nav-item">
                        <a class="nav-link" href="listadoParticipantes.jsp">Participantes de subastas</a>
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
    <body>
        <form>
            <%            String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = DriverManager.getConnection(url, user, pass);
                String rut = request.getParameter("rut");
                String idventa = request.getParameter("idventa");
                PreparedStatement ps = null;
                ResultSet rs = null;
                Statement st = null;
            %>
            <table class="content-table">
                <thead>
                    <tr>
                        <th>Rut del productor</th>
                        <th>Producto ofrecido</th>
                        <th>Calidad del producto</th>
                        <th>Peso producto</th>  
                        <th>Precio por el producto</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String sql_procesoventa = "SELECT * FROM DETALLE_PROCESO_VENTA WHERE rut_usuario = " + rut + " and id_venta = " + idventa + "";
                        ps = cn.prepareStatement(sql_procesoventa);
                        rs = ps.executeQuery();
                        while (rs.next() == true) {
                    %>
                    <tr class="active-row">
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>   
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
            <%
                String correoquery = "SELECT pcv.id_venta, pv.titulo_venta, pv.descripcion_venta, pv.region_entrega, pv.comuna_entrega, sum(pcv.precio_producto), u.nombre_usuario, u.correo_electronico, pv.id_pedido, pcv.rut_usuario \n "
                        + "FROM DETALLE_PROCESO_VENTA pcv \n "
                        + "JOIN usuario u on u.rut_usuario = pcv.rut_usuario \n "
                        + "join proceso_venta pv on pv.id_venta = pcv.id_venta \n "
                        + "WHERE pcv.rut_usuario = " + rut + " and pcv.id_venta = " + idventa + " \n "
                        + "group BY pcv.id_venta, u.nombre_usuario, u.correo_electronico,pv.descripcion_venta, pv.region_entrega, pv.comuna_entrega, pv.titulo_venta, pv.id_pedido, pcv.rut_usuario";
                ps = cn.prepareStatement(correoquery);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <input style="display: none" value="<%=rs.getString(10)%>" name="txtRutProductor" type="text">
            <input style="display: none" value="<%=rs.getString(9)%>" name="txtIdPedido" type="text">
            <input style="display: none" value="<%=rs.getString(1)%>" name="txtId" type="text">
            <input style="display: none" value="<%=rs.getString(2)%>" name="txtTitulo" type="text">
            <input style="display: none" value="<%=rs.getString(3)%>" name="txtDesc" type="text">
            <input style="display: none" value="<%=rs.getString(4)%>" name="txtRegion" type="text">
            <input style="display: none" value="<%=rs.getString(5)%>" name="txtComuna" type="text">
            <input style="display: none" value="<%=rs.getString(6)%>" name="txtValor" type="text">
            <input style="display: none" value="<%=rs.getString(7)%>" name="txtUser" type="text">
            <input style="display: none" value="<%=rs.getString(8)%>" name="txtEmail" type="text">
            <a style="font-size: 30px; font-weight: bold; margin-left: 30%">TOTAL: $ <%=rs.getString(6)%></a> 
            <input style="font-size: 30px; float: right; font-weight: bold; margin-right: 30%; " value="Aceptar" type="submit" name="txtEnviarMail"> 
            <%
                }

            %>
            <%  if (request.getParameter("txtEnviarMail") != null) {
                    String id = request.getParameter("txtId");
                    String titulo = request.getParameter("txtTitulo");
                    String desc = request.getParameter("txtDesc");
                    String region = request.getParameter("txtRegion");
                    String comuna = request.getParameter("txtComuna");
                    String valor = request.getParameter("txtValor");
                    String userName = request.getParameter("txtUser");
                    String mail = request.getParameter("txtEmail");
                    String idpedido = request.getParameter("txtIdPedido");
                    String rutProductor = request.getParameter("txtRutProductor");

                    try {
                        st = cn.createStatement();
                        String correoInsert = "INSERT INTO CORREO \n "
                                + "VALUES (SEQ_CORREO.nextval,'SISTEMA','" + userName + "','SYSTEM-MAIL-DO-NOT-REPLY@SYSTEM','" + mail + "','Proceso de venta','Le queremos informar que ha sido aceptado para el pedido con titulo: " + titulo + " y descripcion: " + desc + " con destino a: " + comuna + ", " + region + " por un valor total de: $ " + valor + ".',(SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL),(SELECT TO_CHAR(SYSDATE, 'HH24:MI') FROM DUAL),'NO')";
                        String deletedpv = "DELETE FROM detalle_proceso_venta where id_venta = '" + id + "'";
                        String deletepv = "DELETE FROM proceso_venta WHERE id_venta = '" + id + "'";
                        String pedidoestado = "UPDATE pedidos SET Estado_pedido = 'En proceso' WHERE id_pedido = " + idpedido + "";
                        String rutProductorUpdate = "UPDATE PEDIDOS SET RUT_PRODUCTOR = '" + rutProductor + "' WHERE id_pedido = '" + idpedido + "'";
                        st.executeUpdate(correoInsert);
                        st.executeUpdate(deletedpv);
                        st.executeUpdate(deletepv);
                        st.executeUpdate(pedidoestado);
                        st.executeUpdate(rutProductorUpdate);
                        response.sendRedirect("AnimFolder/PedidoLoading.jsp");
                    } catch (Exception e) {
                    }

                }
            %>
        </form>
    </body>
</html>
