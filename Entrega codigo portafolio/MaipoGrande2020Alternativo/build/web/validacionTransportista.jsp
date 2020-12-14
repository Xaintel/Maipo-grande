<%-- 
    Document   : validacionTranportista
    Created on : 26-10-2020, 19:16:04
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String user_http;
            String pass_http;
            
            
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "ADMIN";
            String pass = "123";
            Class.forName(driver);
            Connection cn = DriverManager.getConnection(url,user,pass);
            
            if(sesion.getAttribute("user") == null && sesion.getAttribute("pass") == null){
                out.print("<script> location.replace('index.jsp'); </script>");
            }
            
            if(sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null){
                user_http = sesion.getAttribute("user").toString();
                String query = "SELECT * FROM CAMION C JOIN USUARIO U ON c.rut_usuario_transportista = u.rut_usuario where u.nombre_usuario = '"+user_http+"'";
                PreparedStatement ps = cn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                if (rs.next() == true) {                        
                    response.sendRedirect("Transportista.jsp");
                    }else{
                    response.sendRedirect("crearCamion.jsp");
                }
            }
        %>
    </body>
</html>
