<%-- 
    Document   : nuevoContrato
    Created on : 19-10-2020, 17:44:57
    Author     : inter
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        
            <%
            HttpSession sesion = request.getSession();
            String user_http;
            
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "ADMIN";
            String pass = "123";
            Class.forName(driver);
            Connection cn = DriverManager.getConnection(url,user,pass);
            
            if(sesion.getAttribute("user") == null && sesion.getAttribute("pass") == null){
                out.print("<script> location.replace('index.jsp'); </script>");
            }
            
            %>

       
        <form class="form">
            <h2>Creacion de nuevo contrato</h2>
            <br><br>
        Rut
        <% 
            if(sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null){
                user_http = sesion.getAttribute("user").toString();
                String query = "SELECT U.RUT_USUARIO, (U.NOMBRE || ' ' || U.APELLIDO_PATERNO || ' ' || U.APELLIDO_MATERNO) AS NOMBRE_COMPLETO, U.DIRECCION, r.NOMBRE_REGION, c.NOMBRE_COMUNA, to_char(to_date(sysdate, 'DD-MM-YYYY')) AS FECHA_INICIO_CONTRATO, to_char(to_date(sysdate+366, 'DD-MM-YYYY')) AS FECHA_TERMINO_CONTRATO  FROM USUARIO U JOIN comuna c on U.id_comuna = c.id_comuna JOIN region r on u.id_region = r.id_region WHERE NOMBRE_USUARIO = '"+user_http+"'";
                PreparedStatement ps = cn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()==true) { 
        %>
        <input type="text" name="txtRut" value="<%=rs.getString(1)%>" readonly="readonly"> 


        <br><br>
        Nombre completo
        <input type="text" name="txtNombre" value="<%=rs.getString(2)%>" readonly="readonly">  
        <br><br>
        Direccion
        <input type="text" name="txtDireccion" value="<%=rs.getString(3)%>" readonly="readonly"> 
        <br><br>
        Region
        <input type="text" name="txtRegion" value="<%=rs.getString(4)%>" readonly="readonly">  
        <br><br>
        Comuna
        <input type="text" name="txtComuna" value="<%=rs.getString(5)%>" readonly="readonly">  
        <br><br>
        Fecha inicio de contrato
        <input type="text" name="txtInicio" value="<%=rs.getString(6)%>" readonly="readonly">  
        <br><br>
        Fecha de termino contrato
        <input type="text" name="txtFinal" value="<%=rs.getString(7)%>" readonly="readonly">  
        <br><br><br>
        <%}}%>
        <button type="submit" name="btnAceptar">Aceptar </button>
        </form>
        <%
            if(request.getParameter("btnAceptar") != null){
            int rut = Integer.parseInt(request.getParameter("txtRut"));
            String fecha_inicio = request.getParameter("txtInicio");
            String fecha_termino = request.getParameter("txtFinal");
            
            Statement st = null;
            
            try {
                    st=cn.createStatement();
                    String insertContrato = "INSERT INTO CONTRATO \n"+ 
                            "VALUES (SEQ_CONTRATO.nextval, '"+rut+"', '"+fecha_inicio+"', '"+fecha_termino+"')";
                    st.executeUpdate(insertContrato);
                    response.sendRedirect("validacionUsuarioContrato.jsp");
                } catch (Exception e) {
                    out.print(e.getMessage());
                }
            }
            %>
    </body>
</html>
