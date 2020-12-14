<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>JSP Page</title>
        <link href="../css/subastacss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form>
            <%
                String driver = "oracle.jdbc.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521/XE";
                String user = "ADMIN";
                String pass = "123";
                Class.forName(driver);
                Connection cn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                Statement st = null;
                cn = DriverManager.getConnection(url, user, pass);
                String cod = request.getParameter("id");

            %>
            <h1>Participantes</h1>
            <table class="content-table">
                <thead>
                    <tr>
                        <th>Codigo del pedido</th>
                        <th>Rut transportista</th>
                        <th>Nombre del transportista</th>
                        <th>Patente del camion</th>
                        <th>Monto ofrecido por el translado</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%                        String participantes = "SELECT PS.COD_PEDIDO, PS.RUT_TRANSPORTISTA, U.NOMBRE || ' ' || U.APELLIDO_PATERNO || ' ' || U.APELLIDO_MATERNO AS NOMBRE_COMPLETO, PS.PATENTE_CAMION, PS.MONTO_OFRECIDO, u.nombre_usuario, u.correo_electronico, p.descripcion, r.nombre_region, c.nombre_comuna \n"
                                + "FROM PROCESO_SUBASTA PS \n"
                                + "JOIN USUARIO U ON U.RUT_USUARIO = ps.rut_transportista \n"
                                + "JOIN pedidos p on p.id_pedido = ps.cod_pedido \n"
                                + "JOIN REGION R on p.region = r.id_region \n"
                                + "JOIN COMUNA C ON p.comuna = c.id_comuna \n"
                                + "WHERE COD_PEDIDO = " + cod + "";
                        ps = cn.prepareStatement(participantes);
                        rs = ps.executeQuery();
                        while (rs.next() == true) {
                    %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                <input type="text" name="txtrut" style="display: none" value="<%=rs.getString(2)%>">
                <input type="text" name="txtcod" style="display: none" value="<%=rs.getString(1)%>">
                <input type="text" name="txtuser" style="display: none" value="<%=rs.getString(6)%>">
                <input type="text" name="txtmail" style="display: none" value="<%=rs.getString(7)%>">
                <input type="text" name="txtdesc" style="display: none" value="<%=rs.getString(8)%>">
                <input type="text" name="txtregion" style="display: none" value="<%=rs.getString(9)%>">
                <input type="text" name="txtcomuna" style="display: none" value="<%=rs.getString(10)%>">
                <td><input type="submit" name="btnSeleccion" value="Seleccionar"></td>

                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </form>
        <%
            if (request.getParameter("btnSeleccion") != null) {
                String pedidocode = request.getParameter("txtcod");
                String username = request.getParameter("txtuser");
                String email = request.getParameter("txtmail");
                String desc = request.getParameter("txtdesc");
                String region = request.getParameter("txtregion");
                String comuna = request.getParameter("txtcomuna");
                String ruttransportista = request.getParameter("txtrut");

                try {
                    st = cn.createStatement();
                    String sqlUpdate = "UPDATE PEDIDOS SET RUT_TRANSPORTISTA = " + ruttransportista + " where id_pedido = " + pedidocode + "";
                    String sqlUpdate2 = "UPDATE PEDIDOS SET ESTADO_PEDIDO = 'En camino' WHERE id_pedido = " + pedidocode + "";
                    String mailtotransportista = "INSERT INTO CORREO \n "
                            + "VALUES (SEQ_CORREO.nextval,'SISTEMA','" + username + "','SYSTEM-MAIL-DO-NOT-REPLY@SYSTEM','" + email + "','Ha sido seleccionado!','Usted ha sido seleccionado para el envio de un pedido hacia la ubicacion de " + region + " en la comuna de  " + comuna + ". Los productos estan listos para ser enviados a su destinatario, lo esperamos en maipo grande',(SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL),(SELECT TO_CHAR(SYSDATE, 'HH24:MI') FROM DUAL),'NO')";
                    st.executeUpdate(sqlUpdate);
                    st.executeUpdate(sqlUpdate2);
                    st.executeUpdate(mailtotransportista);
                    //REEMPLAZAR
                    out.print("Envio correcto!");
                } catch (Exception e) {
                    e.getMessage();
                }
            }
        %>
    </body>
</html>
