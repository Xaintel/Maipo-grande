<%-- 
    Document   : carritoProductos
    Created on : 30-10-2020, 17:28:04
    Author     : inter
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/tablesCss.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            HttpSession sesion = request.getSession(true);
            ArrayList<Producto> productos = sesion.getAttribute("carritoProducto") == null ? null : (ArrayList) sesion.getAttribute("carritoProducto");
        %>
        <form>
            <table class="content-table">
                <thead>
                    <tr>
                        
                        <th>Nombre del producto</th>
                        <th>Peso del producto</th>


                        <th>Precio del producto</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr class="active-row">
                        <%
                        for (Producto p : productos){
                             p.getIdCompra();
                        
                    %>
                        <td><a><%= p.getNomProducto()%></a></td>
                        <td><a><%= p.getPesoProducto() %></a></td>
                        <a hidden=""><%=p.getRutProductor()%></a>
                        <td><a><%= p.getPrecioProducto() %></a></td>
                        
                    </tr>
                    <%
                      }
                    %>
                </tbody>
            </table>
                <%
                    int total = 0;
                    for (Producto p : productos){
                        total += p.getPrecioProducto();
                    }
                %>
                <p style="margin-left: 53%; font-size: 25px">TOTAL: $ <%=total%></p>
                <div>
                    <button style="font-size: 20px;
                                width: 300px;
                                margin-left: 40%;
                                border-radius: 5px;
                                color: #000;"><a style="text-decoration: none; color: #000" href="SeleccionPago.jsp?total=<%=total%>">Comprar</a></button>
                <br> <br>
                <button style="font-size: 20px;
                                width: 300px;
                                margin-left: 40%;
                                border-radius: 5px;
                                color: #000;"><a style="text-decoration: none; color: #000" href="javascript: window.history.go(-2);">Volver a comprar</a></button>
                </div>
        </form>
    </body>
</html>
