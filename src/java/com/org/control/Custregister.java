/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.org.control;

import com.org.model.Custdetail;
import java.io.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rohit Miryala
 */
public class Custregister extends HttpServlet {

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
            Custdetail c = new Custdetail();
            c.setCust_name(cust_name);
            c.setCust_contact(cust_contact);
            c.setCust_location(cust_location);
            c.setCust_bldg_soc(cust_bldg_soc);
            c.setRoom_flat_no(cust_room_flat_no);
            c.setCust_email(cust_email);
            c.setCust_password(cust_password);

            if (c.save() != 0) {
                String USER_NAME = "smartlaundry024@gmail.com";
     String PASSWORD = "smartlaundry@123"; // GMail password
     String RECIPIENT = cust_email;

   
        String from = USER_NAME;
        String pass = PASSWORD;
        String[] to = { RECIPIENT }; // list of recipient email addresses
        String subject = "Smart Laundry  || Order Booking";
        String body = "Your Order has been place sucessfully ";

       
 
   
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session ses = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(ses);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = ses.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (Exception ae) {
            System.out.println(ae);;
        }
                
                
                out.println("<script> alert('Register successful');</script>");
                
                // Redirection to other page
                RequestDispatcher rd= request.getRequestDispatcher("custlogin.jsp");
                rd.include(request,response);
               
            } 
            else 
                {
                    out.println("<script> alert('Something Went Wrong');</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("custlogin.jsp");
                    rd.include(request, response);
                }

        } catch (Exception sql) {
            System.out.println(sql);
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
