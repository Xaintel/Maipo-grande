<%-- 
    Document   : crearCamion
    Created on : 26-10-2020, 19:19:42
    Author     : inter
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/cssCamion.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form class="form">
<!-- Termino Validar Sesion de usuario -->   
            <% 
                String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = DriverManager.getConnection(url,user,pass);
                PreparedStatement ps = null;
                ResultSet rs = null;
                Statement st = null;
                HttpSession sesion = request.getSession();
                String user_http;
                user_http = sesion.getAttribute("user").toString();
                
            %>    
            <h2>Inscripcion de datos del camion</h2>   
            <div>
                <%
                    String sql_user = "SELECT RUT_USUARIO FROM USUARIO WHERE NOMBRE_USUARIO = '"+user_http+"'";
                    ps = cn.prepareStatement(sql_user);
                    rs = ps.executeQuery();
                    while (rs.next()==true) {                                              
                %>
                <input hidden="" name="txtRut" value="<%=rs.getString(1)%>">
                <%
                    }
                %>
                    <a>Año del vehiculo</a>
                    <select name="cbxAnio">
                        <option value="0">--SELECCIONAR AÑO--</option>
                        <option value="2020">2020</option>
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                        <option value="1979">1979</option>
                        <option value="1978">1978</option>
                        <option value="1977">1977</option>
                        <option value="1976">1976</option>
                        <option value="1975">1975</option>
                        <option value="1974">1974</option>
                        <option value="1973">1973</option>
                        <option value="1972">1972</option>
                        <option value="1971">1971</option>
                        <option value="1970">1970</option>
                        <option value="1969">1969</option>
                        <option value="1968">1968</option>
                        <option value="1967">1967</option>
                        <option value="1966">1966</option>
                        <option value="1965">1965</option>
                        <option value="1964">1964</option>
                        <option value="1963">1963</option>
                        <option value="1962">1962</option>
                        <option value="1961">1961</option>
                        <option value="1960">1960</option>
                        <option value="1959">1959</option>
                        <option value="1958">1958</option>
                        <option value="1957">1957</option>
                        <option value="1956">1956</option>
                        <option value="1955">1955</option>
                        <option value="1954">1954</option>
                        <option value="1953">1953</option>
                        <option value="1952">1952</option>
                        <option value="1951">1951</option>
                        <option value="1950">1950</option>
                        <option value="1949">1949</option>
                        <option value="1948">1948</option>
                        <option value="1947">1947</option>
                        <option value="1946">1946</option>
                        <option value="1945">1945</option>
                        <option value="1944">1944</option>
                        <option value="1943">1943</option>
                        <option value="1942">1942</option>
                        <option value="1941">1941</option>
                        <option value="1940">1940</option>
                        <option value="1939">1939</option>
                        <option value="1938">1938</option>
                        <option value="1937">1937</option>
                        <option value="1936">1936</option>
                        <option value="1935">1935</option>
                        <option value="1934">1934</option>
                        <option value="1933">1933</option>
                        <option value="1932">1932</option>
                        <option value="1931">1931</option>
                        <option value="1930">1930</option>
                        
                    </select>
                    <br><br>
                    <a>Marca</a>
                    <select name="cbxMarca">
                        <option value="0">-Seleccione-</option>
                        <%
                            String sql_marca = "Select * from marca ORDER BY TIPO_MARCA ASC";
                            ps = cn.prepareStatement(sql_marca);
                            rs = ps.executeQuery();
                            while (rs.next()==true) {
                        %>
                        <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                        <%
                            }
                        %>
                    </select>
                    <br><br>
                    <a>Modelo</a>
                    <input name="txtModelo" type="text">
                    <br><br>
                    <a>Patente</a>
                    <input name="txtPatente" type="text">
                    <br><br>
                    <a>Nro de motor</a>
                    <input name="txtMotor" type="text">
                    <br><br>
                    <a>Nro de Chasis</a>
                    <input name="txtChasis" type="text">
                    <br><br>
                    <a>Combustible</a>
                    <select name="cbxCombustible">
                        <option value="DIESEL">DIESEL</option>
                        <option value="ELECTRICO">ELECTRICO</option>
                    </select>
                    <br><br>
                    <a>Nro de serie</a>
                    <input name="txtSerie" type="text">
                    <br><br>
                    <a>Color</a>
                    <input name="txtColor" type="text">
                    <br><br>
                    <a>Año de Adquisicion</a>
                    <input type="date" name="dateAdquisicion">
                    <br><br>
                    <a>Año de inscripcion</a>
                    <input type="date" name="dateInscripcion">
                    <br><br>
                    <a>Año de emision</a>
                    <input type="date" name="dateEmision">
                    <br><br>
                    <a>Revision tecnica al dia (SI/NO)</a>
                    <input style="width: 200px" type="radio" id="Si" name="radio" value="Si">
                    <input style="width: 200px" type="radio" id="No" name="radio" value="No" >
                    <br><br><br>
                    
                </div>
                    <button type="submit" name="btnAgregar">Aceptar Contrato</button>
        </form>
        
                    <%
                        if(request.getParameter("btnAgregar")!=null){
                            String año_vehiculo = request.getParameter("cbxAnio");
                            int marca = Integer.parseInt(request.getParameter("cbxMarca"));
                            String modelo = request.getParameter("txtModelo");
                            String patente = request.getParameter("txtPatente");
                            String nro_motor = request.getParameter("txtMotor");
                            String nro_chasis = request.getParameter("txtChasis");
                            String combustible = request.getParameter("cbxCombustible");
                            String nro_serie = request.getParameter("txtSerie");
                            String color = request.getParameter("txtColor");
                            String adquisicion = request.getParameter("dateAdquisicion");
                            String inscripcion = request.getParameter("dateInscripcion");
                            String emision = request.getParameter("dateEmision");
                            String revision = request.getParameter("radio");
                            String rut = request.getParameter("txtRut"); 
                            
                            try {
                                    st = cn.createStatement();
                                    String sql_insert = "INSERT INTO CAMION \n" + 
                                                        "VALUES ('"+patente+"','"+rut+"', '"+año_vehiculo+"',"+marca+",'"+modelo+"','"+nro_motor+"','"+nro_chasis+"','"+combustible+"','"+nro_serie+"','"+color+"','"+adquisicion+"','"+inscripcion+"','"+emision+"','"+revision+"')";
                                    st.executeUpdate(sql_insert);
                                    response.sendRedirect("validacionTransportista.jsp");
                                } catch (Exception e) {
                                    %>
                                    <a style="color: red; font-size: 20px; font-weight: bold; margin-left: 45%; ">Error al insertar datos</a>
                                    <%
                                }
                        }
                    %>

    </body>
</html>
