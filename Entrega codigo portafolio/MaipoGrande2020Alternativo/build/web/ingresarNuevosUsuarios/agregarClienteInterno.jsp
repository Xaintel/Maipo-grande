<%-- 
    Document   : agregarClienteExterno
    Created on : 23-09-2020, 21:25:35
    Author     : inter
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="../css/form.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="nav-bar">
        <script>
            function validarDatos() {
                usuario = document.getElementById("username").value;
                contrasenia = document.getElementById("password").value;
                rut = document.getElementById("rut").value;
                nombre = document.getElementById("name").value;
                apellido1 = document.getElementById("lastname1").value;
                apellido2 = document.getElementById("lastname2").value;
                direccion = document.getElementById("adress").value;
                region = document.getElementById("region").value;
                comuna = document.getElementById("comuna").value;
                telefono = document.getElementById("phone").value;
                email = document.getElementById("mail").value;

                if (usuario.length > 0 && contrasenia.length >= 3 && rut.length >= 8 && nombre.length > 0 && apellido1.length > 0 && apellido2.length > 0 && direccion.length > 0 && region != 0 && comuna != 0 && telefono.length == 9 && email.length > 0) {
                    document.getElementById("insertuser").click();
                    document.getElementById("errortext").style.display = "none";
                } else {
                    document.getElementById("errortext").style.display = "block";
                }
            }
        </script>

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
                            <a class="dropdown-item" href="agregarClienteExterno.jsp">Cliente externo</a>
                            <a class="dropdown-item" href="agregarClienteInterno.jsp">Clientes interno</a>
                            <a class="dropdown-item" href="agregarConsultor.jsp">Consultor</a>
                            <a class="dropdown-item" href="agregarProductor.jsp">Productor</a>
                            <a class="dropdown-item" href="agregarTransportista.jsp">Transportista</a>
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
                            <a class="dropdown-item" href="../listadoParticipantes.jsp">Productores</a>
                            <a class="dropdown-item" href="../subastaTransporte.jsp">Transportistas</a>
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
        <div class="alert" id="errortext" style="font-size: 15px; display: none;">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            Error: Los campos estan erroneos o incompletos.
        </div> 


        <form class="form">      

            <%                       String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = DriverManager.getConnection(url, user, pass);
            %>
            <h2>Nuevo cliente interno</h2>
            <br><br>
            <a>Nombre usuario:</a> 

            <input type="text" name="txtUsuario" placeholder="Ingrese nuevo usuario" id="username"> 
            <br><br>
            <a>Contraseña: </a>

            <input type="password" name="psw" placeholder="Ingrese contraseña" id="password"> 
            <br><br>
            <a> Rut: </a> 

            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" name="txtRut" placeholder="Ingrese Rut" id="rut" maxlength="9"> 
            <br><br>
            <a>Nombre:</a>

            <input type="text" name="txtNombre" placeholder="Ingrese Nombres" id="name"> 
            <br><br>
            <a>Apellido Paterno: </a>

            <input type="text" name="txtApellidoP" placeholder="Ingrese apellido paterno" id="lastname1">
            <br><br>
            <a>Apellido Materno:</a>

            <input type="text" name="txtApellidoM" placeholder="Ingrese apellido materno" id="lastname2"> 
            <br><br>
            <a>Direccion:</a>

            <input type="text" name="txtDireccion" placeholder="Ingrese direccion" id="adress"> 
            <br><br>
            <a>Region</a>

            <select name="cbxRegion" id="region">
                <option value="0">-- Selecciona tu region --</option>

                <%
                    String sql = "select * from Region";
                    PreparedStatement ps = cn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%> </option>
                <%
                    }
                %>
            </select>
            <br><br>
            <a>Comuna</a>  

            <select name="cbxComuna" id="comuna">
                <option value="0"> -- Selecciona tu comuna --</option>
                <%
                    String comuna_query = "Select * from comuna";
                    PreparedStatement pst = cn.prepareStatement(comuna_query);
                    ResultSet rst = pst.executeQuery();
                    while (rst.next() == true) {
                %>
                <option value="<%=rst.getString(1)%>"><%=rst.getString(2)%></option>
                <%
                    }
                %>
            </select>
            <br><br>
            <a>Numero de telefono:</a>

            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" name="txtTelefono" placeholder="Ingrese telefono" id="phone" maxlength="9"> 
            <br><br>
            <a>Correo Electronico:</a>

            <input type="email" name="txtCorreo" placeholder="Ingrese correo" id="mail"> 
            <br>

            <br>

            <br>
            <button type="button" value="Agregar nuevo usuario" onclick="validarDatos()"> Agregar nuevo usuario </button>
            <button type="submit" name="btnAgregar" value="Agregar nuevo usuario" style="display: none" id="insertuser"> Agregar nuevo usuario </button>
        </form>

        <%
            if (request.getParameter("btnAgregar") != null) {
                int rut = Integer.parseInt(request.getParameter("txtRut"));
                String usuario = request.getParameter("txtUsuario");
                String password = request.getParameter("psw");
                String nombre = request.getParameter("txtNombre");
                String apellidoP = request.getParameter("txtApellidoP");
                String apellidoM = request.getParameter("txtApellidoM");
                String direccion = request.getParameter("txtDireccion");
                int region = Integer.parseInt(request.getParameter("cbxRegion"));
                int comuna = Integer.parseInt(request.getParameter("cbxComuna"));
                int telefono = Integer.parseInt(request.getParameter("txtTelefono"));
                String correo = request.getParameter("txtCorreo");

                Statement stment = null;

                try {
                    stment = cn.createStatement();
                    String insert = "INSERT INTO USUARIO (RUT_USUARIO, NOMBRE_USUARIO, CONTRASENIA, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, DIRECCION, ID_REGION, ID_COMUNA, TELEFONO_CELULAR, CORREO_ELECTRONICO, ID_ROL)\n"
                            + "VALUES (" + rut + ",'" + usuario + "','" + password + "','" + nombre + "','" + apellidoP + "','" + apellidoM + "','" + direccion + "'," + region + "," + comuna + "," + telefono + ",'" + correo + "',4)";

                    stment.executeUpdate(insert);

                    out.print("Datos insertados correctamente");

                } catch (Exception e) {
                    out.print(e.getMessage());
                }

            }
        %>
        <script type="text/javascript" 
                src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
        </script>
    </body>
</html>
