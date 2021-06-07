<%@page import="java.io.PrintWriter"%>
<%@page import="com.org.model.Clothdetail" %>
<%
    int cloth_id=Integer.parseInt(request.getParameter("cloth_id"));
    Clothdetail c=new Clothdetail();
    c.delete(cloth_id);
    response.sendRedirect("allcloths.jsp");

%>
