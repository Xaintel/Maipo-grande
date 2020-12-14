/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author inter
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        String usuario = request.getParameter("txtUser");
        String pass = request.getParameter("txtPass");
        int id_rol = Integer.parseInt(request.getParameter("cbxRol"));
        /*Recordatorio: Insertar el numero de roles en esta pagina segun if para redireccionarlos a su pagina de destino: 
        Plan A: proceso corto crear combobox en la seccion del login.
        Plan B: Crear proceso automatico de reconocimiento de rol segun usuario.
        */
        Consultas co = new Consultas();
        HttpSession sesion = request.getSession();
        switch(id_rol){
            case 0: 
                if(co.autenticacion(usuario, pass, id_rol)){
                   response.sendRedirect("loginError.jsp");
            }   else{
                    response.sendRedirect("loginError.jsp");
                }
                break;
            case 1: 
                if(co.autenticacion(usuario, pass, id_rol)){
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("pass", pass);
                    response.sendRedirect("principal.jsp");
                    
                }else{
                    response.sendRedirect("loginError.jsp");
                }
                break;
            case 2:
                if(co.autenticacion(usuario, pass, id_rol)){
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("pass", pass);
                    response.sendRedirect("validacionUsuarioContrato.jsp");
                }else{
                    response.sendRedirect("loginError.jsp");
                }
                break;
            case 3: 
                if(co.autenticacion(usuario, pass, id_rol)){
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("pass", pass);
                    response.sendRedirect("ClienteExterno.jsp");
                }else{
                    response.sendRedirect("loginError.jsp");
                }
                break;
            case 4:
                if(co.autenticacion(usuario, pass, id_rol)){
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("pass", pass);
                    response.sendRedirect("ClienteInterno.jsp");
                }else{
                    response.sendRedirect("loginError.jsp");
                }
                break;
            case 5: 
                if(co.autenticacion(usuario, pass, id_rol)){
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("pass", pass);
                    response.sendRedirect("validacionTransportista.jsp");
                }else{
                    response.sendRedirect("loginError.jsp");
                }
                break;
            case 6:
                if(co.autenticacion(usuario, pass, id_rol)){
                    sesion.setAttribute("user", usuario);
                    sesion.setAttribute("pass", pass);
                    response.sendRedirect("Consultor.jsp");
                }else{
                    response.sendRedirect("loginError.jsp");
                }
                break;
            default:
                out.write("El usuario '" + "' no existe o contraseña invalida");
                
        }
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
