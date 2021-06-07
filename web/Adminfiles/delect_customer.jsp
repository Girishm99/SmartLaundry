<%@page import="com.org.model.Custdetail" %>
<%
    int Cust_id=Integer.parseInt(request.getParameter("cust_id"));
    Custdetail c=new Custdetail();
    c.delete(Cust_id);
    response.sendRedirect("allcustomer.jsp");
%>