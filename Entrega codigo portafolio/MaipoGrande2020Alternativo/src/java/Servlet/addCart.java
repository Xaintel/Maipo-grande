/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Clases.Articulo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author inter
 */
public class addCart extends HttpServlet {

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
        
        int idProceso = Integer.parseInt(request.getParameter("txtIdProducto"));
        int idVenta = Integer.parseInt(request.getParameter("txtIdVenta"));
        int rut = Integer.parseInt(request.getParameter("txtRut"));
        String producto = request.getParameter("txtNombre");
        String estado = request.getParameter("cbxEstado");
        int peso = Integer.parseInt(request.getParameter("txtPeso"));
        int precio = Integer.parseInt(request.getParameter("txtPrecio"));
        
        HttpSession sesion = request.getSession(true);
        ArrayList <Articulo> articulo = sesion.getAttribute("carrito") == null ? new ArrayList<>() : (ArrayList)sesion.getAttribute("carrito");
        boolean flag = false;
        

                if(!flag)
                {
                    articulo.add(new Articulo(idProceso, idVenta, rut, producto, estado, peso, precio));
                }
                
                sesion.setAttribute("carrito", articulo);
                
                response.sendRedirect("carro.jsp");
            
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
