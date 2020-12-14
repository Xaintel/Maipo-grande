<%-- 
    Document   : ProcesoVenta
    Created on : 19-10-2020, 23:04:28
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
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
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
                        <a class="nav-link" href="ProcesoVenta.jsp">Proceso de ventas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="controlContratos.jsp">Controlar contratos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listadoSolicitudProductos.jsp">Solicitud de productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listadoParticipantes.jsp">Listado de participantes del proceso de venta</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listarPedidos.jsp">Pedidos</a>
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
        <form class="form">

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
                String id = request.getParameter("id");
                user_http = sesion.getAttribute("user").toString();
            %>
            <h2>Proceso de venta</h2>
            <br>
            <%
                String nextnum = "SELECT (MAX(ID_VENTA)+1) AS SIGUIENTE_NRO FROM PROCESO_VENTA";
                ps = cn.prepareStatement(nextnum);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <input type="text" name="txtId" style="display: none" value="<%=rs.getInt(1)%>" readonly="read">

            <%
                }
            %>
            <br><br>


            <%
                String pedidosdata = "SELECT p.id_pedido, p.titulo, p.descripcion, p.dinero_maximo, r.nombre_region, c.nombre_comuna, p.fecha_publicacion, p.publicacion_venta, u.nombre_usuario, u.correo_electronico FROM PEDIDOS P \n "
                        + "JOIN region r ON r.id_region = p.region \n "
                        + "join comuna c on c.id_comuna = p.comuna \n "
                        + "join usuario u on u.rut_usuario = p.rut_solicitante \n "
                        + "WHERE id_pedido = " + id + "";
                ps = cn.prepareStatement(pedidosdata);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <input type="text" name="txtid" style="display: none" value="<%=rs.getString(1)%>" >

            <a>Titulo:</a>
            <input type="text" name="txtTitulo"> 
            <br><br>
            <a>Dinero maximo</a>
            <input type="text" name="txtDinero" value="<%=rs.getString(4)%>"> 
            <br><br>
            <a>Region de entrega:</a>
            <input type="text" name="txtRegion" value="<%=rs.getString(5)%>"> 
            <br><br>
            <a>Comuna de entrega:</a>
            <input type="text" name="txtComuna" value="<%=rs.getString(6)%>"> 
            <input style="display: none" type="text" name="txtIdPedido" value="<%=id%>"> 
            <br><br>
            <input style="display: none" type="text" name="txtUser" value="<%=rs.getString(9)%>">
            <input style="display: none" type="text" name="txtEmail" value="<%=rs.getString(10)%>">
            <input style="display: none" type="text" name="txtPublicacion" value="<%=rs.getString(8)%>">
            <%
                }
            %>
            <a>Descripcion: </a> 
            <textarea type="text" name="txtDescripcion" style="height: 250px; text-align: left; text-justify: auto; position: inherit; padding: 0 15px 200px;"></textarea>
            <br><br><br><br><br><br><br><br><br><br><br>
            <a>Fecha de publicacion:</a>
            <%
                String sysdate = "Select to_char(to_date(sysdate, 'DD-MM-YY')) AS FECHA from dual";
                ps = cn.prepareStatement(sysdate);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <input type="text" name="txtFecha" value="<%=rs.getString(1)%>" readonly="read"> 

            <%
                }
            %>
            <br><br><br>
            <button type="submit" name="btnPublicar"> Subir Proceso</button>

            <%
                if (request.getParameter("btnPublicar") != null) {
                    String nroVenta = request.getParameter("txtId");
                    String idpedido = request.getParameter("txtid");
                    String titulo = request.getParameter("txtTitulo");
                    String descripcion = request.getParameter("txtDescripcion");
                    String fecha = request.getParameter("txtFecha");
                    String dinero_ofrecido = request.getParameter("txtDinero");
                    String region_entrega = request.getParameter("txtRegion");
                    String comuna_entrega = request.getParameter("txtComuna");

                    //Send Email and Send change of data
                    String email = request.getParameter("txtEmail");
                    String userName = request.getParameter("txtUser");

                    try {
                        st = cn.createStatement();
                        String insertarVenta = "INSERT INTO PROCESO_VENTA \n"
                                + "VALUES ('" + nroVenta + "','" + idpedido + "','" + titulo + "','" + descripcion + "','" + dinero_ofrecido + "','" + region_entrega + "','" + comuna_entrega + "','" + fecha + "','YES')";
                        String sendEmail = "INSERT INTO CORREO \n "
                                + "VALUES (SEQ_CORREO.nextval,'SISTEMA','" + userName + "','SYSTEM-MAIL-DO-NOT-REPLY@SYSTEM','" + email + "','Su pedido', 'Su pedido para la direccion " + comuna_entrega + ", " + region_entrega + " con el precio de $ " + dinero_ofrecido + " ha sido aceptado, sera notificado cuando algunos de nuestros productores acepten el pedido.',(SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL),(SELECT TO_CHAR(SYSDATE, 'HH24:MI') FROM DUAL),'NO')";
                        String update = "UPDATE pedidos \n "
                                + "SET publicacion_venta = 'SI' \n "
                                + "WHERE id_pedido = "+idpedido+"";
                        st.executeUpdate(insertarVenta);
                        st.executeUpdate(update);
                        st.executeUpdate(sendEmail);
                        
                        out.print("Lista publicada correctamente");
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }
                }
            %>
        </form>
    </body>
</html>
