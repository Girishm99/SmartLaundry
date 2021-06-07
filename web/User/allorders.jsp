<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="com.org.dc.DAL"%>
<%
    if (session.getAttribute("cust_name") == null) {
        response.sendRedirect("../custlogin.jsp");
    }
%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Smart Laundry || Your Orders</title>

        <link rel="icon" type="image/gif" width="" href="../images/giphy.gif">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />

        <!-- GLOBAL MAINLY STYLES-->
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../fontawesome-free-5.12.0-web/css/solid.css" rel="stylesheet" type="text/css"/>
        <link href="../fontawesome-free-5.12.0-web/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <link href="./assets/vendors/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
        <!-- THEME STYLES-->
      <link href="./assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="assets/css/main.min.css" rel="stylesheet" />
        <!-- PAGE LEVEL STYLES-->
    </head>

    <body class="fixed-navbar">
        <div class="page-wrapper">
             <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="index.jsp">
                             <img src="../images/laundry!_1.png"  width="300px" alt=""/>
                      <!--  <span class="brand">Smart 
                            <span class="brand-tip"><span>Laundry</span>
                            </span>
                            <span class="brand-mini"> </span>
                        </span>-->
                    </a>
                </div>
                <div class="flexbox flex-1">
                    <!-- START TOP-LEFT TOOLBAR-->
                    <ul class="nav navbar-toolbar">
                        <li>
                            <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
                        </li>
                        <li>
                            <form class="navbar-search" action="">
                                <div class="rel">
                                    <span class="search-icon"><i class="ti-search"></i></span>
                                    <input class="form-control" placeholder="Search here...">
                                </div>
                            </form>
                        </li>
                    </ul>
                    <!-- END TOP-LEFT TOOLBAR-->
                    <!-- START TOP-RIGHT TOOLBAR-->
                    <ul class="nav navbar-toolbar">


                       
                            
                                
                                <a class="dropdown-item" href="user_logout.jsp"> <i class="fa fa-power-off"></i>Logout</a>
                    </ul>
                    <!-- END TOP-RIGHT TOOLBAR-->
                </div>
            </header>
            <!-- END HEADER-->
            <!-- START SIDEBAR-->
            <nav class="page-sidebar" id="sidebar">
                <div id="sidebar-collapse">
                    <div class="admin-block ">
                        <div >
                            <img src="../images/Admin.gif"  width="200px," class="img-container img-fluid" alt="Admin "/> 
                        </div><br>
                        <div class="admin-info ">
                            <div class="font-strong" style="display:flex; align-items: center; justify-content: center;"> 
                                <h5><%=session.getAttribute("cust_name")%> </h5></div></div>
                    </div>
                    <ul class="side-menu metismenu">


                        <li>
                            <a href="user_profile.jsp"><i class="sidebar-item-icon  fa fa-user"></i>
                                <span class="nav-label"> Your Profile</span></a>

                        </li>
                        <li>
                            <a href="allorders.jsp"><i class="sidebar-item-icon fa fa-shopping-cart"></i>
                                <span class="nav-label">Your Orders</span></a>

                        </li>
                        <li>
                            <a href="requestorder.jsp"><i class="sidebar-item-icon fa fa-cart-plus"></i>
                                <span class="nav-label">Request Order</span></a>

                        </li>
                        

                        <li>
                            <a href="feedback.jsp"><i class="sidebar-item-icon fa fa-sitemap"></i>
                                <span class="nav-label">Feedback</span></a>

                        </li>
                    </ul>
                </div>
            </nav>
            <!-- END SIDEBAR-->
            <!-- END SIDEBAR-->
            <div class="content-wrapper">
                <!-- START PAGE CONTENT-->

          <!-- START PAGE CONTENT-->
                <div class="page-heading">
                    <h1 class="page-title">Your Orders</h1>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="la la-home font-20"></i></a>
                        </li>

                        <li class="breadcrumb-item"><a href="" style="text-decoration: #000">Home</a> / <a href="">your Orders</a></li>
                    </ol>
                </div>
              
                                 
                                    
 
     
        
        
        
                  
                    <div class="ibox-body" style="overflow-x:auto;">
                        <table class="table table-bordered table-hover table-bordered table-striped"  width="100%">
                            <thead>
                                <tr>
                                    <th><%--<%= s%>--%>SR NO.</th>
                                    <th>ORDER_ID</th>
                                    <th>ORDER DATE</th>
                                    <th>NAME</th>
                                    <th>EMAIL</th>
                                    <th>CONTACT NO.</th>
                                    <th>ADDRESS</th>
                                    <th>BUILDING/CHAWL NO.</th>
                                    <th>ROOM NO.</th>
                                    <th>ORDER STATUS</th>
                                    <th>GET INVOICE</th>
                                    
                                </tr>
                            </thead>
                          
                            
                                
                                    <%
         DAL d=new DAL();
         String sql="SELECT orders.order_id, orders.order_date, orders.order_status, orders.total_amount, "
                 + "cust_detail.cust_name, cust_detail.cust_email, cust_detail.cust_location, "
                 + "cust_detail.cust_bldg_soc, cust_detail.room_flat_no, "
                 + "cust_detail.cust_contact, cust_detail.cust_id "
                 + "FROM orders "
                 + "INNER JOIN cust_detail "
                 + "ON orders.cust_id = cust_detail.cust_id "
                 + "WHERE orders.cust_id AND cust_detail.cust_id=" + session.getAttribute("cust_id");
         //out.println(sql);
        ResultSet rs=d.executeQuery(sql);
        int s=0;
      while(rs.next())
              {
                  s++;
       //String a = rs.getString("order_id");
           //String b = rs.getString("order_date");
           //String c = rs.getString("order_date");
           //String m = rs.getString("cust_name");
           //String e = rs.getString("cust_email");
           //String f = rs.getString("cust_contact");
           //String g = rs.getString("cust_location");
           //String h = rs.getString("cust_bldg_soc");
           //String i = rs.getString("room_flat_no");
           //out.println(a);
           //out.println(b);
           //out.println(c);
           //out.println(m);
           //out.println(e);
          // out.println(f);
          // out.println(g);

           ///out.println(h);
          // out.println(i);
           //out.close();
              
            %>
                                <tr>
                                 <td><%= s%></td>
                                    <td><%=rs.getString("order_id") %></td>
                                    <td><%=rs.getString("order_date")%></td>
                                    
                                    <td><%=rs.getString("cust_name")%></td>
                                    <td><%=rs.getString("cust_email")%></td>
                                    <td><%=rs.getString("cust_contact")%></td>
                                     <td><%=rs.getString("cust_location")%></td>
                                     <td><%=rs.getString("cust_bldg_soc")%></td>
                                     <td><%=rs.getString("room_flat_no")%></td>
                                    
                                     <td><%=rs.getString("order_status")%></td>
                                     <td><a href="invoice.jsp?order_id=<%=rs.getString("order_id")%>">INVOICE</a></td>
                                </tr>
                                
                                
                                <%
                                    }
%>
                               
                                
       
                              
                     
                     
                            </tbody>
                        </table>
                    </div>
                
              
            </div>                                        
                                 
                                   




                <!-- END PAGE CONTENT-->
                <footer class="page-footer">
                    <div class="font-13">2020 © <b>Smart Laundry</b> - All rights reserved.</div>
                <img src="../images/311bbca247b777bdd43129a7b6cf4404.gif" width="90px"  alt=""/></div>
            <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
        </footer>
    </div>
</div>


<!-- BEGIN PAGA BACKDROPS-->
<div class="sidenav-backdrop backdrop"></div>
<div class="preloader-backdrop">
    <div class="page-preloader">Loading</div>
</div>
<!-- END PAGA BACKDROPS-->
<!-- CORE PLUGINS-->
    <script src="./assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS-->
    <script src="./assets/vendors/DataTables/datatables.min.js" type="text/javascript"></script>
    <!-- CORE SCRIPTS-->
    <script src="assets/js/app.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL SCRIPTS-->
    <script type="text/javascript">
        $(function() {
            $('#example-table').DataTable({
                pageLength: 10,
                //"ajax": './assets/demo/data/table_data.json',
                /*"columns": [
                    { "data": "ORDER ID" },
                    { "data": "NAME" },
                    { "data": "extn" },
                    { "data": "start_date" },
                    { "data": "salary" }
                ]*/
            });
        })
        
    </script>
</body>

</html>