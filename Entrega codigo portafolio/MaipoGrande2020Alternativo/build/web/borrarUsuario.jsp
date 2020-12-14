<%-- 
    Document   : borrarUsuario
    Created on : 30-10-2020, 21:04:39
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
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "ADMIN";
            String pass = "123";
            Class.forName(driver);
            Connection cn = DriverManager.getConnection(url,user,pass);
            int rut = Integer.parseInt(request.getParameter("rut"));
            PreparedStatement ps = null;
            ResultSet rs = null;
            Statement st = null;
            try {
                    st = cn.createStatement();
                    String update = "DELETE FROM USUARIO WHERE RUT_USUARIO = "+rut+"";
                    st.executeUpdate(update);
                    response.sendRedirect("principal.jsp");
                } catch (Exception e) {
                    e.getMessage();
                }
            

        %>
    </body>
</html>
