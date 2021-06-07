<% 
    
    
    
    out.println("<script> alert('Ordered successfull');</script>");
                 RequestDispatcher rd= request.getRequestDispatcher("User/request_order.jsp");
                rd.include(request, response);
                %>