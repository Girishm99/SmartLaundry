/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.org.dc.DAL;
import com.org.model.Custdetail;
import java.io.*;
import java.sql.ResultSet;
import javax.servlet.http.*;
import javax.servlet.*;

/**
 *
 * @author Girish Musham
 */
public class CustomerLogin extends HttpServlet {

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
           
               Custdetail a=new Custdetail();
           if(a.checkLogin(request.getParameter("cust_email"),request.getParameter("cust_password"))!=null){
               HttpSession s=request.getSession(true);
            
               s.setAttribute("cust_name",a.getCust_name());
               s.setAttribute("cust_id",a.getCust_id());
               s.setAttribute("cust_bldg_soc",a.getCust_bldg_soc());
               s.setAttribute("cust_contact",a.getCust_contact());
               s.setAttribute("cust_email",a.getCust_email());
               s.setAttribute("cust_room_no",a.getRoom_flat_no());
                 
                
               
               /*DAL d= new DAL();
               String sql="select * from cust_detail where cust_id=" + a.getCust_id();
                 out.println(sql);  
           ResultSet rs=d.executeQuery(sql);
           rs.next();
           
              // out.println(rs.getString("cust_contact"));
            // out.println(rs.getString("cust_location"));
            // out.println(rs.getString("cust_email"));
            //  out.println(rs.getString("cust_bldg_soc"));
            //   out.println(rs.getString("room_flat_no"));
             //  out.close();
             
               
               
               
               
                 s.setAttribute("cust_contact", rs.getString("cust_contact"));
                s.setAttribute("cust_location", rs.getString("cust_location"));
                 s.setAttribute("cust_email", rs.getString("cust_email"));
                  s.setAttribute("cust_bldg_soc", rs.getString("cust_bldg_soc"));
                   s.setAttribute("room_flat_no",rs.getString("room_flat_no"));*/
            
               
               
              response.sendRedirect("User/index.jsp");
           }else{
              out.println("<script> alert('Enter Correct username and password');</script>");
                
                // Redirection to other page
                //response.sendRedirect("custlogin.jsp");
               RequestDispatcher rd= request.getRequestDispatcher("custlogin.jsp");
               rd.include(request,response);
           }
        }catch(Exception e){
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
