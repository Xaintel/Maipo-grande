<%-- 
    Document   : realizarPedido
    Created on : 02-11-2020, 0:11:30
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
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
            
            function ValidarDatos(){
                titulo = document.getElementById("titulo").value;
                desc = document.getElementById("desc").value;
                dinero = document.getElementById("dinero").value;
                comuna = document.getElementById("comuna").value;
                
                if(titulo.length > 5 && desc.length > 10 && comuna != "0"){
                    document.getElementById("realizarpedido").click();
                }else{
                    document.getElementById("errormsg").style.display = "block";
                }
                
            }

        </script>

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
        <%            user_http = sesion.getAttribute("user").toString();
            String sql_fecha = "SELECT TO_CHAR(to_date(SYSDATE, 'DD-MM-YYYY'), 'DD-MM-YYYY') FROM DUAL";
            ps = cn.prepareStatement(sql_fecha);
            rs = ps.executeQuery();
            while (rs.next() == true) {
        %>
        <form class="form">
            <h2>Realiza tu pedido</h2>

            <br><br>
            Fecha
            <input type="text" name="dateFecha" readonly="" value="<%=rs.getString(1)%>">
            <%
                }
            %>
            <%
                String sql_rut = "SELECT * FROM USUARIO WHERE NOMBRE_USUARIO = '" + user_http + "'";
                ps = cn.prepareStatement(sql_rut);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <input type="text" name="txtRut" hidden="" value="<%=rs.getString(1)%>">
            <input type="text" name="txtRole" id="role" hidden="" value="<%=rs.getString(12)%>">
            <%}%>
            <br><br>
            Titulo
            <input type="text" name="txtTitulo" id="titulo">
            <br><br>
            Maximo a ofrecer ($): 
            <input type="number" name="txtMaxDinero" id="dinero"> 
            <br><br>
            Region del pedido:
            <select name="cbxRegion">
                <%
                    String sql_region = "select * from Region";
                    ps = cn.prepareStatement(sql_region);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%> </option>
                <%
                    }
                %>
            </select>
            <br><br>
            Comuna del pedido:
            <select name="cbxComuna" id="comuna">
                <option value="0">--SELECCIONA TU COMUNA--</option>
                <%
                    String sql_comuna = "select * from Comuna";
                    ps = cn.prepareStatement(sql_comuna);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%> </option>
                <%
                    }
                %>
            </select>
            <br><br>
            Descripcion 
            <textarea name="txtDescripcion" placeholder="Ingrese los productos que desee solicitar" style="height: 200px" id="desc"></textarea>

            <br><br><br><br><br><br><br><br><br><br>
            <button type="button" onclick="ValidarDatos()">Realizar pedido</button>
            <button type="submit" name="btnRealizar" style="display: none" id="realizarpedido">Realizar pedido</button>
            <br><br>
            <a style="color: red; font-weight: bold; margin-left: 60px; display: none" id="errormsg">Los campos estan erroneos o no estan completos</a>
        </form>

        <%
            if (request.getParameter("btnRealizar") != null) {
                int rut = Integer.parseInt(request.getParameter("txtRut"));
                String titulo = request.getParameter("txtTitulo");
                int dineromax = Integer.parseInt(request.getParameter("txtMaxDinero"));
                int region = Integer.parseInt(request.getParameter("cbxRegion"));
                int comuna = Integer.parseInt(request.getParameter("cbxComuna"));
                String descripcion = request.getParameter("txtDescripcion");
                String fecha = request.getParameter("dateFecha");

                try {
                    st = cn.createStatement();
                    String insert = "INSERT INTO PEDIDOS VALUES (SEQ_PEDIDOS.nextval," + rut + ",'" + titulo + "'," + dineromax + "," + region + "," + comuna + ",'" + descripcion + "','" + fecha + "', 'NO', 'SIN ESTADO', NULL, NULL)";
                    st.executeUpdate(insert);
                    out.print("Pedido realizado");
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
