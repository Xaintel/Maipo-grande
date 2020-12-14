<%-- 
    Document   : PagoDebito
    Created on : 16-11-2020, 14:08:27
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
        <script type="text/javascript">     
            
            
            
            function VerificarDatos(){
                var rut = document.getElementById("rut");
                var clave = document.getElementById("clave");
                
                
                if(rut.value === null || rut.value === '' || rut.value.length <= 8 || clave.value === null || clave.value === '' || clave.value.length < 4) {
                    document.getElementById("error").style.display = "block";
                }else{
                    document.getElementById("comprar").style.display = "block";
                    document.getElementById("message1").style.display = "block";
                    document.getElementById("verificar").style.display = "none";
                    document.getElementById("error").style.display = "none";
                }
            }
            
            function MostrarDatos(){
                document.getElementById("datos").style.display = "block";
                document.getElementById("showdata").style.display = "none";
                document.getElementById("value0").style.display = "none";
            }
            
            function VerificarDatos2(){
                if($('#banco :selected').val() !== "0"){
                    MostrarDatos();
                }else{
                    alert('No ha seleccionado un banco');
                }
            }       
        </script> 
    <body>

        
        <%
            String total = request.getParameter("total");
        %>
        <h1>Pago con debito</h1>
        <form>
            <a style="font-size: 20px; font-weight: bold" >Pago por: $ <%=total%> </a>
            <br><br>
            <a>COMPLETA LOS DATOS</a>
            <br><br>
            <a>Seleccione su banco</a>
            <br>
            <select id="banco" name="cbxBanco">
                <option value="0" id="value0">Seleccione banco</option>
                <option value="BANCO SANTANDER">BANCO SANTANDER</option>
                <option value="BANCO SANTANDER BANEFE">BANCO SANTANDER BANEFE</option>
                <option value="BANCO ITAU">BANCO ITAU</option>
                <option value="BCI-TBANC">BCI-TBANC</option>
                <option value="BANCO FALABELLA">BANCO FALABELLA</option>
                <option value="CORPBANCA">CORPBANCA</option>
                <option value="BANCO DE CHILE">BANCO DE CHILE/ EDWARDS CITI</option>
                <option value="BANCO ESTADO">BANCO ESTADO</option>
                <option value="BANCO BICE">BANCO BICE </option>
                <option value="BANCO SECURITY">BANCO SECURITY</option>
                <option value="BANCO CONSORCIO">BANCO CONSORCIO</option>
                <option value="BANCO RIPLEY">BANCO RIPLEY</option>
                <option value="BANCO INTERNACIONAL">BANCO INTERNACIONAL</option>
                <option value="SCOTIABANK">SCOTIABANK</option>
                <option value="COOPEUCH">COOPEUCH</option>
            </select>
            <br><br>
            <input type="button" id="showdata" onclick="VerificarDatos2()" value="Continuar">
            <div id="datos" style="display: none">
                <a>RUT</a>
                <br>
                <input type="text" name="txtRut" id="rut" placeholder="INGRESAR RUT SIN GUION (123456789)" maxlength="9">
                <br>
            <br>
            <a>Clave</a>
            <br>
            <input type="password" name="txtClave" id="clave" placeholder="INGRESE SU CLAVE ">
            <input style="display: none" type="text" name="txtPago" value="<%=total%>"
            <br><br><br>
            <input type="button" name="btnVerificar" id="verificar" onclick="VerificarDatos()" value="Verificar datos">
            <a id="message1" style="font-size: 20px; display: none" >Datos verificados correctamente! por favor presione COMPRAR para terminar la venta</a>
            <br>
            <button style="display: none" type="submit" id="comprar" name="btnComprar">Comprar</button>
            <br><br>
            </div>
            <a id="error" style="color: red; font-size: 15px; font-weight: bold; display: none">Campos incompletos o errones</a>
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
                    String banco = request.getParameter("cbxBanco");
                    int rut = Integer.parseInt(request.getParameter("txtRut"));
                    int pago = Integer.parseInt(request.getParameter("txtPago"));
                    
                    try {
                            st = cn.createStatement();
                            String insert_sql = "INSERT INTO DETALLE_COMPRA (ID_COMPRA, TIPO_PAGO ,BANCO_CLIENTE, RUT_CLIENTE, NUMERO_TARJETA, FECHA_VENCIMIENTO, PAGO_TARJETA, FECHA_PAGO) VALUES (SEQ_COMPRA.NEXTVAL,'DEBITO','"+banco+"',"+rut+",NULL,NULL,"+pago+", (SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY') FROM DUAL))";
                            st.executeUpdate(insert_sql);
                            response.sendRedirect("loading.jsp");
                        } catch (Exception e) {
                            e.getMessage();
                        }
                }
            
            %>
            <script type="text/javascript" 
                src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">          
            </script>
    </body>
</html>
