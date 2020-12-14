<%-- 
    Document   : ConfirmacionCompra
    Created on : 30-10-2020, 19:32:41
    Author     : inter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String total = request.getParameter("total");
        %>
        <h1>Metodo de pago</h1>

        <br>
        <a href="PagoDebito.jsp?total=<%=total%>"><img src="img/RedCompra.jpg" width="300" height="200" border="1"></a>
        <br><br>
        <a href="PagoCredito.jsp?total=<%=total%>"><img src="img/Credito.jpg" width="300" height="200" border="1"></a>
        <br><br>
        <a style="font-size: 30px; font-weight: bold">Total a cancelar: <%=total%></a>
    </body>
</html>
