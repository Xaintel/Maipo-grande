<%-- 
    Document   : PagoCredito
    Created on : 16-11-2020, 14:08:37
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
        <script type="text/javascript">  
            
            
            function ValidarFormulario2(){
                var numtarjeta = document.getElementById("tarjeta");
                var fecha = document.getElementById("fecha");
                var codigo = document.getElementById("codigo");   
                
                if(numtarjeta.value === null || numtarjeta.value === '' || numtarjeta.value.length < 16 || codigo.value === null || codigo.value === '' || codigo.value.length < 3 || fecha.value === ''){
                    document.getElementById("errorMessage").style.display = "block";
                }else{
                    document.getElementById("errorMessage").style.display = "none";
                    document.getElementById("successMessage").style.display = "Block";
                    document.getElementById("btncomprar").style.display = "block";
                    document.getElementById("btnverificar").style.display = "none";
                    document.getElementById("btnmod").style.display = "block";
                }
            }
            
            function ModificarDatos(){
                    document.getElementById("banco").disabled = false;
                    document.getElementById("tarjeta").disabled = false;
                    document.getElementById("fecha").disabled = false;
                    document.getElementById("codigo").disabled = false; 
                    document.getElementById("btncomprar").style.display = "none";
                    document.getElementById("btnverificar").style.display = "block";
                    document.getElementById("btnmod").style.display = "none";
                    document.getElementById("successMessage").style.display = "none";
            }
            
            function MostrarForm(){
                document.getElementById("formulario").style.display = "block";
                document.getElementById("continuar").style.display = "none";
                document.getElementById("value0").style.display = "none";
            }
            
            function ValidarFormulario1(){
                if($('#banco :selected').val() !== "0"){
                    MostrarForm();
                }else{
                    alert('No se ha seleccionado un banco');
                }
            }
            
        </script>
        <%
            String total = request.getParameter("total");
        %>
        <h1>Pago con credito</h1>
        <form>
            <a>Pago por: $ <%=total%></a>
            <br>
            <a>COMPLETAR DATOS</a>
            <br>
            <a>Tipo de credito</a>
            <select id="banco" name="cbxCredito" >
                <option value="0" id="value0">Seleccione</option>
                <option value="VISA">VISA</option>
                <option value="MASTERCARD">MASTERCARD</option>
                <option value="AMERICAN EXPRESS">AMERICAN EXPRESS</option>
                <option value="DINNERS CLUB INTERNATIONAL">DINNERS CLUB INTERNATIONAL</option>
                <option value="MAGNA">MAGNA</option>
            </select>
            <br>
            <input type="button" id="continuar" onclick="ValidarFormulario1()" value="Continuar">
            <div style="display: none" id="formulario">
                <a>Numero de tarjeta</a>
                <input type="text" name="txtTarjeta" id="tarjeta" placeholder="XXXX XXXX XXXX XXXX" maxlength="16">
                <br>
                <a>Fecha de vencimiento</a>
                <input type="month" name="txtFecha" id="fecha" >
                <br>
                <a>Codigo de seguridad</a>
                <input type="password" name="txtCodigo" id="codigo" maxlength="3">
                <br>
                <input type="button" name="btnVerificar" id="btnverificar" onclick="ValidarFormulario2()" value="Verificar datos">
                <input style="display: none" type="text" name="txtTotal" value="<%=total%>"> 
                <br>
                <button type="button" name="btnMod" id="btnmod" onclick="ModificarDatos()" style="display: none">Modificar datos</button>
                <br>
                <button type="submit" name="btnComprar" id="btncomprar" style="display: none">Comprar</button>
                <a id="successMessage" style="display: none">Validacion correcta! Presione comprar para terminar el proceso de venta.</a>
                <a id="errorMessage" style="display: none">Los campos estan incompletos o estan erroneos</a>
            </div>
        </form>
                <%
                //Connection
                String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = DriverManager.getConnection(url,user,pass);   
                Statement st = null;
                
                if(request.getParameter("btnComprar") != null){
                    String banco = request.getParameter("cbxCredito");
                    String tarjeta = request.getParameter("txtTarjeta");
                    String fecha = request.getParameter("txtFecha");
                    int pago = Integer.parseInt(request.getParameter("txtTotal"));
                    
                    try {
                            st = cn.createStatement();
                            String insert_sql = "INSERT INTO DETALLE_COMPRA (ID_COMPRA, TIPO_PAGO ,BANCO_CLIENTE, RUT_CLIENTE, NUMERO_TARJETA, FECHA_VENCIMIENTO, PAGO_TARJETA, FECHA_PAGO) VALUES (SEQ_COMPRA.NEXTVAL,'CREDITO','"+banco+"',null,'"+tarjeta+"','"+fecha+"',"+pago+", (SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY') FROM DUAL))";
                            st.executeUpdate(insert_sql);
                            response.sendRedirect("loading.jsp");
                        } catch (NumberFormatException ex) {
                            ex.getMessage();
                        }
                }                    
                %>
            <script type="text/javascript" 
                src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">          
            </script>
    </body>
</html>
