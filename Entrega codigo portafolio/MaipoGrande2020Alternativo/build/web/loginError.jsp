<%-- 
    Document   : index
    Created on : 11-09-2020, 1:43:29
    Author     : inter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="alert" id="errormsg2" style="font-size: 20px;">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            Error: Los datos ingresados se encuentran erroneos.
        </div> 
        <div class="login_form">
            <img src="img/logo-bg3.png" height="200" width="200" style="margin-top: 30px; margin-left: 100px">
            <form action="Login" method="post"> 

                <div class="formulario">
                    <br>
                    <br>
                    <input type="text" name="txtUser" placeholder="Ingrese su nombre de usuario">
                    <br>
                    <br>

                    <input type="password" name="txtPass" placeholder="Ingrese su contraseña">
                    <br>
                    <br>

                    <div class="custom-select">
                        <select name="cbxRol">
                            <optgroup class="options">
                                <option value="0">Seleccionar</option>
                                <option value="1">Administrador</option>
                                <option value="2">Productor</option>
                                <option value="3">Cliente Externo</option>
                                <option value="4">Cliente Interno</option>
                                <option value="5">Transportista</option>
                                <option value="6">Consultor</option>
                            </optgroup>
                        </select>
                    </div>
                    <br> <br>
                    <button type="submit" value="Inicar sesion" name="btnIngresar" >Iniciar sesion</button>
                    <br>
                    </form>


                    </body>
                    </html>
