<%-- 
    Document   : AgregarProducto
    Created on : 25-09-2020, 14:46:59
    Author     : inter
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <script>
            function validarDatos() {
                producto = document.getElementById("producto").value;
                peso = document.getElementById("peso").value;
                estado = document.getElementById("estado").value;
                precio = document.getElementById("precio").value;

                if (producto != "0" && peso > 0 && estado != "0" && precio > 0) {
                    document.getElementById("btnagregar").click();
                } else {
                    document.getElementById("messageerror").style.display = "block";
                }


            }
        </script>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Maipo Grande: Productor</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="PantallaProductor.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="agregarProducto.jsp">Ingresar producto<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="listadoProcesosVenta.jsp">Subastas<span class="sr-only"></span></a>
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
    <body>

        <%            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "ADMIN";
            String pass = "123";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement ps = null;
            ResultSet rs = null;
            user_http = sesion.getAttribute("user").toString();
        %>
        <form class="form">
            <h2>Agregar productos</h2>
            <br>
            <br>
            <%
                String query_rut = "select rut_usuario from usuario where nombre_usuario = '" + user_http + "'";
                ps = conn.prepareStatement(query_rut);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <input name="txtRut" readonly="" hidden="" value="<%=rs.getString(1)%>">
            <%
                }
            %>
            Nombre productor:

            <%
                String query_name = "select (NOMBRE || ' ' || APELLIDO_PATERNO || ' ' || APELLIDO_MATERNO) AS nombre_completo from usuario where nombre_usuario = '" + user_http + "'";
                ps = conn.prepareStatement(query_name);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <input readonly="" name="txtNomProductor" value="<%=rs.getString(1)%>">
            <%
                }
            %>
            <br><br>
            Nombre producto: 
            <select name="cbxProducto" id="producto">
                <option value="0">-Seleccionar-</option>
                <%
                    String query_prod = "Select * from producto ORDER BY NOMBRE_PRODUCTO";
                    ps = conn.prepareCall(query_prod);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {

                %>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                <%
                    }
                %>
            </select>
            <br><br>
            Peso producto

            <input type="number" name="txtTonelaje" placeholder="Peso en kilogramos" id="peso">
            <br><br>
            Estado del producto

            <select name="cbxEstado" id="estado">
                <option value="0">-- Seleccione el estado --</option>
                <%
                    String sql = "SELECT * FROM ESTADO_PRODUCTO";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%> </option>
                <%
                    }
                %>
            </select>
            <br><br>
            Precio producto
            <input type="text" name="txtPrecio" id="precio">
            <br><br>
            <button type="button" onclick="validarDatos()" >Ingresar producto </button>
            <input type="submit" name="btnAgregar" style="display: none" value="Ingresar producto" id="btnagregar" > 
            <br>
            <a id="messageerror" style="color: red; font-weight: bold; margin-left: 100px; display: none"  >No se han completado todos los datos.</a>

            <%
                if (request.getParameter("btnAgregar") != null) {
                    String productor = request.getParameter("txtNomProductor");
                    int rut = Integer.parseInt(request.getParameter("txtRut"));
                    int fruta = Integer.parseInt(request.getParameter("cbxProducto"));
                    int peso = Integer.parseInt(request.getParameter("txtTonelaje"));
                    int estado = Integer.parseInt(request.getParameter("cbxEstado"));
                    int precio = Integer.parseInt(request.getParameter("txtPrecio"));
                    Statement st = null;

                    try {
                        st = conn.createStatement();
                        String ip = "insert into PRODUCTO_VENTA \n"
                                + "values(SEQ_VENTA_PRODUCTO.nextval," + rut + ",'" + productor + "'," + fruta + "," + peso + ", " + precio + ", " + estado + " ,'NO', 'NO')";
                        st.executeUpdate(ip);
                        out.print("El producto ha sido agregado exitosamente");
                    } catch (Exception e) {
                        out.print("ERROR: No se ha podido agregar el producto!");
                    }
                }
            %>
        </select
    </form>
    <script type="text/javascript" 
            src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
    </script>
</body>
</html>
