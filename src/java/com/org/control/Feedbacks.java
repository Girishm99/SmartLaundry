/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.org.control;

import com.org.model.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Girish Musham
 */
public class Feedbacks extends HttpServlet {

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
             String f_name=request.getParameter("f_name");
           String f_email=request.getParameter("f_email");
           String f_message=request.getParameter("f_message");
           
           Feedback c=new Feedback();
           c.setF_name(f_name);
            c.setF_email(f_email);
            c.setF_message(f_message);
            
            
           if(c.save()!=0)
           {
               
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
              
                out.println("</head>");
                out.println("<body>");

                out.println("<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>");
                out.println("<script> swal(\"Message Send\"   ,   \"\"   ,    \"success\")</script>");
                out.println("</body>");
                out.println("</html>");

                
                
                // Redirection to other page
                //RequestDispatcher rd= request.getRequestDispatcher("");
               //rd.include(request,response);
               
              response.sendRedirect("User/feedback.jsp");
              
           }
           //else{
              //response.sendRedirect("#");
              // }  
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
