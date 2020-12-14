<%-- 
    Document   : procesoSubasta
    Created on : 04-12-2020, 19:10:39
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
        <link href="../css/form.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Maipo Grande: Transportista</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="../Transportista.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="subasta.jsp">Subastas<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Estado transporte<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="../AnimFolder/CorreoLoading.jsp">Correo<span class="sr-only"></span></a>
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
        <form class="form">
            <h2>Participacion</h2>

            <%            String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = DriverManager.getConnection(url, user, pass);
                PreparedStatement ps = null;
                ResultSet rs = null;
                Statement st = null;
                user_http = sesion.getAttribute("user").toString();
                String cod = request.getParameter("cod");
            %>
            <br>
            <a>Codigo de pedido</a>
            <input type="text" value="<%=cod%>" name="txtcod" readonly="">
            <br><br>
            <%
                String userrut = "Select * from usuario WHERE nombre_usuario = '" + user_http + "'";
                ps = cn.prepareStatement(userrut);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <a>Rut del transportista</a>
            <input type="text" value="<%=rs.getString(1)%>" name="txtrut" readonly="">
            <br><br>
            <%
                }
            %>
            <%
                String camionsql = "SELECT PATENTE FROM CAMION C JOIN USUARIO U ON u.rut_usuario = c.rut_usuario_transportista WHERE U.NOMBRE_USUARIO = '" + user_http + "'";
                ps = cn.prepareStatement(camionsql);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <a>Patente del camion</a>
            <input type="text" value="<%=rs.getString(1)%>" name="txtpatente" readonly="">
            <br><br>
            <%
                }
            %>
            <a>Dinero a conseguir</a>
            <input placeholder="Cuanto dinero desea conseguir" type="number" name="txtdinero">
            <br><br>
            <button type="submit"name="btnParticipar">Participar</button>
        </form>

        <%
            if (request.getParameter("btnParticipar") != null) {
                String codpedido = request.getParameter("txtcod");
                String rut = request.getParameter("txtrut");
                String patente = request.getParameter("txtpatente");
                String dinero = request.getParameter("txtdinero");

                try {
                    st = cn.createStatement();
                    String insertsubasta = "INSERT INTO PROCESO_SUBASTA VALUES (SEQ_PROCESO_SUBASTA.nextval,'" + codpedido + "','" + rut + "','" + patente + "','" + dinero + "')";
                    st.executeUpdate(insertsubasta);
                    //remplazar
                    out.print("Participacion completada!");
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
