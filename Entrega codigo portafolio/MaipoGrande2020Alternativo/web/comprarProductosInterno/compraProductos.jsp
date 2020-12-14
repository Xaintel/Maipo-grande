<%-- 
    Document   : compraSaldo
    Created on : 11-12-2020, 18:18:34
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
        <style>
            body{
                background:  url(../img/paymentbackground2.jpg);
                background-size: 100vw 100vh;
                background-attachment: fixed;
            }
            .debito {
                float:left;
                margin-left: 15%;
                margin-top: 100px;
            }   
            .credito {
                float: right;
                margin-right: 20%;
                margin-top: 120px;
            }
            .debito .img {
                float:left;
                margin-left: 15%;
                margin-top: 100px;

            }  
            .credito .img {
                float: right;
                margin-right: 20%;
                margin-top: 120px;
            }  
            .debito .img:hover {
                float:left;
                margin-left: 15%;
                margin-top: 80px;


            }   
            .credito .img:hover {
                float: right;
                margin-right: 20%;
                margin-top: 100px;
            }
            h1{
                font-family: 'Open Sans', Helvetica, Arial, sans-serif;
                font-size: 30px;
                margin-left: 750px;
                margin-top:  40px;
            }
        </style>

        <%
            String codigo = request.getParameter("cod");
        %>
        <h1>Metodo de pago</h1>


        <div class="debito">
            <a href="pagodebitosaldo.jsp?cod=<%=codigo%>"><img class="img" src="../img/debito.png" width="500" height="500"></a>
        </div>
        <div class="credito">
            <a href="pagocreditosaldo.jsp?cod=<%=codigo%>"><img class="img" src="../img/visalogo.png" width="400" height="400"></a>
        </div>
        <div>

        </div>
    </body>
</html>
