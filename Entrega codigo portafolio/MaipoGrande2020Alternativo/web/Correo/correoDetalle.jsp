<%-- 
    Document   : correoDetalle
    Created on : 30-11-2020, 22:50:05
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/cssMenuCorreo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "200px";
            }

            /* Set the width of the side navigation to 0 */
            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";

            }
            setTimeout(function () {
                ShowPage()
            }, 0000);

            function ShowPage() {
                var str = document.getElementById("role").value;
                switch (str) {
                    case "1":
                        document.getElementById("admin").style.display = "block";
                        break;
                    case "2":
                        document.getElementById("productor").style.display = "block";
                        break;
                    case "3":
                        document.getElementById("externo").style.display = "block";
                        break;
                    case "4":
                        document.getElementById("interno").style.display = "block";
                        break;
                    case "5":
                        document.getElementById("transportista").style.display = "block";
                        break;
                    case "6":
                        document.getElementById("consultor").style.display = "block";
                        break;
                    default:

                }

            }

        </script>
        <!--Change Yes and No check view  -->
        <%
            HttpSession sesion = request.getSession();
            String user_http;
            user_http = sesion.getAttribute("user").toString();

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

            try {
                st = cn.createStatement();
                String viewcheck = "UPDATE correo \n "
                        + "SET correo_visto = 'SI' WHERE id_correo = " + id + "";
                st.executeUpdate(viewcheck);
            } catch (Exception e) {

            }
        %>
        <form>

            <h2 style="margin-left: 215px; font-size: 30px; color: black;">Detalle</h2>
            <div id="mySidenav" class="sidenav" style="width:  200px">
                <img src="../img/email.png" class="image">
                <a href="correo.jsp">Todos</a>
                <svg height="40px" width="200px">
                <line x1="0" y1="10" x2="200" y2="10" style="stroke:rgb(0,0,0);stroke-width:2" />
                </svg> 
                <a href="correoNoVistos.jsp">No vistos</a>
                <svg height="40px" width="200px">
                <line x1="0" y1="15" x2="200" y2="15" style="stroke:rgb(0,0,0);stroke-width:2" />
                </svg>                 
                <a href="correoVistos.jsp">Vistos</a>
                <svg height="40px" width="200px">
                <line x1="0" y1="15" x2="200" y2="15" style="stroke:rgb(0,0,0);stroke-width:2" />
                </svg>
                <%
                    String roleCheck = "SELECT ID_ROL FROM USUARIO WHERE nombre_usuario = '" + user_http + "'";
                    ps = cn.prepareStatement(roleCheck);
                    rs = ps.executeQuery();
                    while (rs.next() == true) {
                %>
                <input type="text" name="txtRole" hidden="" id="role" value="<%=rs.getString(1)%>">
                <%
                    }
                %>

                <a href="../principal.jsp" id="admin" style="display: none">Menu Principal</a>

                <a href="../PantallaProductor.jsp" id="productor" style="display: none">Menu Principal</a>
                <a href="../Transportista.jsp" id="transportista" style="display: none">Menu Principal</a>
                <a href="../ClienteExterno.jsp" id="externo"  style="display: none">Menu Principal</a>

                <a href="../ClienteInterno.jsp" id="interno" style="display: none">Menu Principal</a>
                <a href="../Consultor.jsp" id="consultor" style="display: none">Menu Principal</a>
            </div>
        </form>

        <form class="Formulario">
            <%
                String correoquery = "SELECT * FROM CORREO WHERE ID_CORREO = " + id + "";
                ps = cn.prepareStatement(correoquery);
                rs = ps.executeQuery();
                while (rs.next() == true) {
            %>
            <a class="label">Enviado por: <a><%=rs.getString(2)%></a>  <a class="correo">&lt<%=rs.getString(4)%>&gt</a></a>
            <br><br>
            <a class="label">Enviado a: <a><%=rs.getString(3)%></a> <a class="correo">&lt<%=rs.getString(5)%>&gt</a></a>
            <br><br>
            <a class="label">Fecha: <a><%=rs.getString(8)%></a>  <a class="correo">&lt<%=rs.getString(9)%>&gt</a></a>
            <br><br>
            <a class="label">Asunto: <a><%=rs.getString(6)%></a></a>
            <br><br>
            <a class="label">Mensaje</a>
            <br><br>
            <a>Estimado usuario:</a>
            <br>
            <a style="word-break: break-all"><%=rs.getString(7)%></a>
            <br>
            <a>Muchas gracias por preferirnos.</a>
            <br>
            <a>Maipo Grande.</a>

            <%
                }
            %>
        </form>
    </body>
</html>
