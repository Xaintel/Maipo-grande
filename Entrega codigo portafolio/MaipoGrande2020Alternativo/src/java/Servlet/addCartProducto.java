/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Clases.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.taglibs.standard.tag.el.core.OutTag;

/**
 *
 * @author inter
 */
@WebServlet(name = "addCartProducto", urlPatterns = {"/addCartProducto"})
public class addCartProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int idCompra = Integer.parseInt(request.getParameter("txtVenta"));
        String nomProducto = request.getParameter("txtProducto");
        int peso = Integer.parseInt(request.getParameter("txtPeso"));
        int precio = Integer.parseInt(request.getParameter("txtPrecio"));
        String estado = request.getParameter("txtEstado");
        int vendedor = Integer.parseInt(request.getParameter("txtRut"));

        
        HttpSession sesion = request.getSession(true);
        ArrayList<Producto> productos = sesion.getAttribute("carritoProducto") == null ? new ArrayList<>() : (ArrayList) sesion.getAttribute("carritoProducto");
        
        
        boolean flag = false;
        
        if(!flag){
            productos.add(new Producto(idCompra, nomProducto, peso, precio, estado, vendedor));
        }
        
        sesion.setAttribute("carritoProducto" , productos);
        
        response.sendRedirect("carritoProductos.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
