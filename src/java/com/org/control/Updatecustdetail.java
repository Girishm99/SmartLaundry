/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.org.control;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.org.model.Custdetail;

/**
 *
 * @author Girish Musham
 */
public class Updatecustdetail extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String cust_name = request.getParameter("cust_name");
            String cust_contact = request.getParameter("cust_contact");
            String cust_email = request.getParameter("cust_email");
            String cust_location = request.getParameter("cust_location");
            String cust_bldg_soc = request.getParameter("cust_bldg_soc");
            String cust_room_flat_no = request.getParameter("room_flat_no");
            String cust_password = request.getParameter("cust_password");

            int Cust_id = Integer.parseInt(request.getParameter("cust_id"));
            Custdetail c = new Custdetail();
            c.setCust_name(cust_name);
            c.setCust_contact(cust_contact);
            c.setCust_location(cust_location);
            c.setCust_bldg_soc(cust_bldg_soc);
            c.setRoom_flat_no(cust_room_flat_no);
            c.setCust_email(cust_email);
            c.setCust_password(cust_password);
            //out.println(cloth_id);
            //out.close();
            c.update(Cust_id);
            HttpSession s = request.getSession(true);
            Custdetail a = new Custdetail();
            s.setAttribute("cust_name", a.getCust_name());

        

            out.println("<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>");
            out.println("<script> function myFunction() {\n"
                    + "\n"
                    + "  alert(\"I am an alert box!\");\n"
                    + "}</script>");
        

            // Redirection to other page
            
            RequestDispatcher rd = request.getRequestDispatcher("Adminfiles/User/profile.jsp");
            rd.include(request, response);
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
