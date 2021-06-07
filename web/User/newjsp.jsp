<%@page import="java.sql.ResultSet"%>
<%@page import="com.org.dc.DAL"%>
<%
                    DAL d= new DAL();
                    String sql="SELECT COUNT( order_id ) as total_order ,COUNT(total_amount) as total_amount FROM orders;";
                  
                    
                   
                   // ResultSet rs=d.executeQuery(sql);
                   out.println(sql);
                   out.close();
                    
                    %>
                    