/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.org.control;

import com.org.model.Clothcategory;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;



/**
 *
 * @author Girish Musham
 */
public class addcategory extends HttpServlet {

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
             Clothcategory a=new Clothcategory();
           HttpSession s=request.getSession(true);
               s.setAttribute("cc_id",a.getCc_id());
               s.setAttribute("cc_name",a.getCc_name());
            String cc_name = request.getParameter("cc_name");
            int laundry_price = Integer.parseInt(  request.getParameter("laundry_price"));
            int iron_rate = Integer.parseInt(request.getParameter("iron_rate"));
           // out.println(cc_name);
            //out.println(laundry_price);
            //out.println(iron_rate);
            //out.close();
            Clothcategory c = new Clothcategory();
            c.setCc_name(cc_name);
            c.setLaundry_price(laundry_price);
            c.setIron_rate(iron_rate);
            //out.println(c.save());
            if (c.save() != 0) {
                response.sendRedirect("Adminfiles/allcloth_category.jsp");
            } else {
                
            }
        } catch (Exception e) {
            System.out.println(e);
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
