/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.org.control;

import com.org.model.Clothdetail;
import com.org.dc.DAL;
import com.org.model.Orders;
import com.org.model.Orderdetail;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.http.*;
import javax.servlet.*;

/**
 *
 * @author Girish Musham
 */
public class AddOrder extends HttpServlet {

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
          String cc_id = (request.getParameter("cc_id"));
          String cloth_name = (request.getParameter("cloth_name"));
          String payment_mode = (request.getParameter("payment_mode"));
          String pick_up_date = (request.getParameter("pick_up_date"));
          String delivery_date = (request.getParameter("delivery_date"));
          String pick_up_time = (request.getParameter("pick_up_time"));
          String Delivery_time = (request.getParameter("delivery_time"));
          String cloth_qty = request.getParameter("cloth_qty");
          String order_date = request.getParameter("order_date");
          String  cust_id = (request.getParameter("cust_id"));
          String Cust_email = request.getParameter("cust_email");
         
       
          
           
           
        DAL dal = new DAL(); 
       int quanty = Integer.parseInt(cloth_qty);
       Double total_price;
        String zero = "0 rs";

        String Sql = "select laundry_price,iron_rate FROM cloth_category WHERE cc_id=" + cc_id;
        ResultSet rra = dal.executeQuery(Sql);
        rra.next();
        Double Laundry_price = rra.getDouble("laundry_price");
        Double Iron_rate = rra.getDouble("iron_rate");
            
String status="confirmed";
        total_price = (quanty * Laundry_price) + Iron_rate;
        Orders c = new Orders();
                 
            c.setCc_id(cc_id);
            c.setCust_id(Integer.parseInt(cust_id));
            c.setCloth_name(cloth_name);
            c.setOrder_date(order_date);
            c.setCloth_qty(quanty);
            c.setPayment_mode(payment_mode);
            c.setOrder_status(status);
            
            c.setTotal_amount( total_price);
            c.setPick_up_time(pick_up_time);
            c.setDelivery_time(Delivery_time);
            c.setPick_up_date(pick_up_date);
            c.setDelivery_date(delivery_date);
           // out.println(c.save());
           //String result=c.save();
//           out.println(cc_id);
//          out.println(cloth_name );
//          out.println(payment_mode );
//          out.println(pick_up_date );
//          out.println(pick_up_time);
//         out.println(Delivery_time );
//          out.println( cloth_qty );
//        out.println(order_date);
//          out.println(cust_id );
            if (c.save() != 0) {
                HttpSession s = request.getSession(true);
                 s.setAttribute("laundry_price", Laundry_price);
                s.setAttribute("iron_rate", Iron_rate);
                s.setAttribute("total_price", total_price);
                s.setAttribute("cloth_name", cloth_name);
                s.setAttribute("order_date", order_date);
                s.setAttribute("cloth_qty", cloth_qty);
                s.setAttribute("payment_mode", payment_mode);
                s.setAttribute("pick_up_time", pick_up_time);
                s.setAttribute("delivery_time", Delivery_time);
                s.setAttribute("pick_up_date", pick_up_date);
                s.setAttribute("delivery_date", delivery_date);
                s.setAttribute("payment_mode", payment_mode );
                 s.setAttribute("cc_id", cc_id );
                
                 out.println("<script> alert(' successful');</script>");
                  String USER_NAME = "smartlaundry024@gmail.com";
     String PASSWORD = "smartlaundry@123"; // GMail password
     String RECIPIENT = Cust_email;

   
        String from = USER_NAME;
        String pass = PASSWORD;
        String[] to = { RECIPIENT }; // list of recipient email addresses
        String subject = "Smart Laundry";
        String body = "Your Order has been place sucessfully";

       
 
   
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
      
                
                // Redirection to other page
//                RequestDispatcher rd= request.getRequestDispatcher("User/newjsp1.jsp");
                response.sendRedirect("User/request_order.jsp");
                 
//                out.println("<!DOCTYPE html>");
//                out.println("<html>");
//                out.println("<head>");
//                out.println("<title>Servlet NewServlet2</title>");
//                out.println("</head>");
//                out.println("<body>");
//
//                out.println("<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>");
//                out.println("<script> swal(\" Successfull\", \"\", \"success\")</script>");
//                out.println("</body>");
//                out.println("</html>");
//                out.close();
//                
//                
//                  
//       
//               // Redirection to other page
//            response.sendRedirect("../requestorder.jsp");

               
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet NewServlet2</title>");
                out.println("</head>");
                out.println("<body>");

                out.println("<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>");
                out.println("<script> swal(\" Error\", \"Something Went Wrong\", \"warning\")</script>");
                out.println("</body>");
                out.println("</html>");
                out.close();
                RequestDispatcher rd= request.getRequestDispatcher("user/requestorder.jsp");
                rd.include(request,response);

            }
            

           
         

       // HttpSession s = request.getSession(true);
        ////s.setAttribute("cloth_qty", Q);
       // //s.setAttribute("laundry_price", numL);
       // s.setAttribute("iron_rate", numI);
       // s.setAttribute("total_price", total_price);
       
       

       
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
