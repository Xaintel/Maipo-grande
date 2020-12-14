<%-- 
    Document   : comprarealizada
    Created on : 11-12-2020, 19:40:46
    Author     : inter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            background:  url(../img/Form-Background.jpg);
            background-size: 100vw 100vh;
            background-attachment: fixed;
        }
        img{
            margin-left: 850px;
            padding: 0;
            margin-top: 70px;
        }
        .container{
            text-align: center;
            font-family: 'Open Sans', Helvetica, Arial, sans-serif;
            font-size:  25px;
            background: white;
            border: 1px solid black;
            border-radius:  10px;
            width: 1000px;
            margin: auto;
            color: black;
        }
    </style>
    <body>
        <img src="../img/Sign check.png" height="200px" width="200px">
        <div class="container">
            <h2>Estimado usuario</h2>
            <p>Muchas gracias por tu compra.</p> <p>Te estaremos enviando un correo electronico para entregarte 
                mas informacion acerca de tu producto comprado.</p>
            <p>Puedes mirar mas de nuestros productos presionando <a href="../realizarCompras.jsp" style="text-decoration: none; color: black; font-weight: bold;">AQUÍ.</a></p>
            <p>Muchas gracias por comprar en Maipo Grande te agradecemos tu apoyo!</p>
            <p><a href="../ClienteExterno.jsp" style="text-decoration: none; color: black; font-weight: bold; ">Presiona aqui para volver al menu principal</a></p>
        </div>
    </body>
</html>
