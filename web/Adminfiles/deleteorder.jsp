<%@page import="com.org.model.Orders" %>
<%
    int order_id=Integer.parseInt(request.getParameter("order_id"));
    //out.println(order_id);
    //out.close();
   Orders c=new Orders();
   c.delete(order_id);
   response.sendRedirect("allorder.jsp");
%>

