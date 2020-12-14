<%-- 
    Document   : carro
    Created on : 22-10-2020, 19:47:48
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulo = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/tablesCss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <table class="content-table">
                <thead>
                    <tr>
                        <th>ID VENTA</th>
                        <th>RUT PRODUCTOR</th>
                        <th>NOMBRE PRODUCTO</th>
                        <th>CALIDAD</th>
                        <th>PESO</th>
                        <th>PRECIO</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Articulo a : articulo) {
                            a.getId_proceso();

                    %>
                    <tr>
                        <td><%=a.getId_venta()%></td>
                        <td><%=a.getRut_usuario()%></td>
                        <td><%=a.getNombre_producto()%></td>
                        <td><%=a.getCalidad_producto()%></td>
                        <td><%=a.getPeso_producto()%></td>
                        <td><%=a.getPrecio_producto()%></td>
                <span id="idarticulo" style="display: none"><%=a.getNombre_producto()%></span>          
                </tr>
                <%
                    }
                %>    
                </tbody>
            </table>


            <%  int suma = 0;
                for (Articulo a : articulo) {
                    suma += a.getPrecio_producto();
                }
            %>
            <div style="margin-right:70px; float: right; font-size: 30px; width: 250px;">
                <a>Total: $ <%=suma%></a>
                <br><br>

                <button type="submit" name="btnAgregar" style="    font-size: 20px;

                        border-radius: 5px;
                        color: #000;">Participar</button>
                <br><br>
                <button style="    font-size: 20px;
                        width: 250px;
                        border-radius: 5px;
                        color: #000;"><a style="text-decoration: none; color: #000" href="javascript: window.history.go(-1);">Volver a agregar</a></button>
            </div>

        </form>
        <%
            if (request.getParameter("btnAgregar") != null) {
                String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                cn = DriverManager.getConnection(url, user, pass);
                Statement st = null;

                for (Articulo a : articulo) {
                    st = cn.createStatement();
                    String sql = "INSERT INTO DETALLE_PROCESO_VENTA \n"
                            + "VALUES (SEQ_DETALLE_VENTA.nextval," + a.getId_venta() + "," + a.getRut_usuario() + ",'" + a.getNombre_producto() + "','" + a.getCalidad_producto() + "'," + a.getPeso_producto() + "," + a.getPrecio_producto() + ", 'YES')";
                    st.executeUpdate(sql);

                }
                response.sendRedirect("AnimFolder/CarroLoading.jsp");
            }
        %>

        <script type="text/javascript" 
                src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
        </script>
        <script src="js/carrito.js"></script>
    </body>
</html>
