<%-- 
    Document   : validacionUsuarioContrato
    Created on : 19-10-2020, 17:46:13
    Author     : inter
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
                String query = "SELECT * FROM USUARIO U JOIN CONTRATO C ON u.rut_usuario = c.rut_usuario WHERE NOMBRE_USUARIO = '"+user_http+"'";
                PreparedStatement ps = cn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                if (rs.next() == true) {                        
                    response.sendRedirect("PantallaProductor.jsp");
                    }else{
                    response.sendRedirect("nuevoContrato.jsp");
                }
            }
        %>
    </body>
</html>
