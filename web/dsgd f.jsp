<%
 HttpSession s=request.getSession(true);
               
             out.println(  s.getAttribute("Body"));
    %>