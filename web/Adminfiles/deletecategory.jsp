<%@page import="com.org.model.Clothcategory" %>
<%
    int cc_id=Integer.parseInt(request.getParameter("cc_id"));
    Clothcategory c=new Clothcategory();
    c.delete(cc_id);
    response.sendRedirect("allcloth_category.jsp");
%>
