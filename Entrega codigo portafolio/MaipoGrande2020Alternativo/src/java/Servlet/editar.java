/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author inter
 */
public class editar extends HttpServlet {

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
        
        
        int rut = Integer.parseInt(request.getParameter("txtRut"));
        String nombreusuario = request.getParameter("txtNomUsuario");
        String clave = request.getParameter("txtClave");
        String nombre = request.getParameter("txtNombre");
        String apellidopaterno = request.getParameter("txtApellidoPaterno");
        String apellidomaterno = request.getParameter("txtApellidoMaterno");
        String direccion = request.getParameter("txtDireccion");
        int telefono = Integer.parseInt(request.getParameter("txtTelefono"));
        String correo = request.getParameter("txtCorreo");
        int region = Integer.parseInt(request.getParameter("cbxRegion"));
        int comuna = Integer.parseInt(request.getParameter("cbxComuna"));
        
        
        response.getWriter().print(rut +  " " + nombreusuario + " " + clave +  " " + nombre + " " + apellidopaterno + " " + apellidomaterno + " " + direccion +  " " + telefono + " " + correo +  " " + region + " " + comuna);
        

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
