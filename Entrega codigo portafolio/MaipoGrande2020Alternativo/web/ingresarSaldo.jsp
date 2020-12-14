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
        <link href="css/saldocss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <script>
            function  validarDatos() {
                producto = document.getElementById("producto").value
                peso = document.getElementById("peso").value
                estado = document.getElementById("estado").value
                precio = document.getElementById("precio").value

                if (producto != "0" && peso > 0 && estado != 0 && precio > 0) {
                    document.getElementById("agregarsaldo").click();
                } else {
                    document.getElementById("errormsg").style.display = "block";
                }
            }
        </script>

        <!--Incio barra de navegacion-->

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

        <!-- Termina de barra de navegacion-->
        <div class="alert" id="errormsg" style="display: none; font-size: 20px;">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            Error: Los campos no pueden estar vacios!
        </div> 
        <form class="container">
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
            <h2>Ingresar nuevo saldo</h2>
            <br>

            <a>Agregar producto</a>
            <select name="cbxproducto" id="producto">
                <option value="0">--Seleccione el producto--</option>
                <%
                    String productosql = "select * from producto";
                    ps = cn.prepareStatement(productosql);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(1)%>"> <%=rs.getString(2)%> </option>
                <%
                    }
                %>
            </select>
            <br><br><br>
            <a>Peso del producto</a>
            <input type="number" name="txtpeso" id="peso">
            <br><br><br>
            <a>Estado del producto</a>
            <select name="cbxestado" id="estado">
                <option value="0">--Seleccione estado</option>
                <%
                    String estadosql = "select * from estado_producto";
                    ps = cn.prepareStatement(estadosql);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(1)%>"> <%=rs.getString(2)%> </option>
                <%
                    }
                %>
            </select>
            <br><br><br>
            <a>Motivo de saldo (*)</a>
            <textarea placeholder="Ingrese el motivo por el cual esta ingresando el producto como saldo " name="txtmotivo"></textarea>
            <br><br><br><br><br><br>
            <a>Precio del producto</a>
            <input type="number" name="txtprecio" id="precio">
            <br><br><br>
            <p style="font-weight: bold">(*) = Opcional</p>
            <button type="button" onclick="validarDatos()" >Agregar saldo</button>
            <input type="submit" name="btnSaldo" id="agregarsaldo" style="display: none" value="Agregar saldo">
            
        </form>
        <%
            if (request.getParameter("btnSaldo") != null) {
                String producto = request.getParameter("cbxproducto");
                String peso = request.getParameter("txtpeso");
                String estado = request.getParameter("cbxestado");
                String motivo = request.getParameter("txtmotivo");
                String precio = request.getParameter("txtprecio");

                try {
                    st = cn.createStatement();
                    String insertsaldo = "INSERT INTO SALDOS \n "
                            + "VALUES (SEQ_SALDO.nextval, '" + producto + "','" + precio + "','" + peso + "','" + estado + "','" + motivo + "',(SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL),'NO')";
                    st.executeUpdate(insertsaldo);
                    response.sendRedirect("ingresarSaldo.jsp");
                } catch (Exception e) {
                    out.print("Error al insertar los datos");
                }
            }
        %>
        <script type="text/javascript" 
                src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
        </script>
    </body>
</html>
