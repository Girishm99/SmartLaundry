<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
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
        <title>Smart Laundry || Home</title>

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
            <div class="content-wrapper">
                <!-- START PAGE CONTENT-->

                <%
                    Date date = new Date();
                    SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy");
                    String stringDate = DateFor.format(date);
                    DAL g = new DAL();
                    String SQA = "SELECT COUNT(order_id) AS new_order FROM orders where order_date=" + stringDate;

                    ResultSet rg = g.executeQuery(SQA);
                    rg.next();
                    String new_order = rg.getString("new_order");
                %>

                <div class="page-content fade-in-up">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-success color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong"><%=new_order%></h2>
                                    <div class="m-b-5">NEW ORDERS</div><i class="ti-shopping-cart widget-stat-icon"></i>

                                </div>
                            </div>
                        </div>

                        <%
                            DAL d = new DAL();
                            String sql = "SELECT COUNT( order_id ) as total_order ,sum(total_amount) as total_amount FROM orders;";
                            ResultSet rs = d.executeQuery(sql);
                            rs.next();
                            String Order_num = rs.getString("total_order");
                            String Total_income = rs.getString("total_amount");
                        %>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-info color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong"><%=Order_num%></h2>
                                    <div class="m-b-5">TOTAL ORDERS</div><i class="ti-bar-chart widget-stat-icon"></i>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-warning color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong"><%=Total_income%></h2>
                                    <div class="m-b-5">TOTAL Money Spent</div><i class="fa fa-money widget-stat-icon"></i>

                                </div>
                            </div>
                        </div>
                        <%
                            String SQa = "SELECT COUNT( cust_id ) AS total_cust FROM cust_detail";

                            ResultSet ra = d.executeQuery(SQa);
                            ra.next();
                            String cust_num = ra.getString("total_cust");
                        %>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-danger color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong"><%=cust_num%></h2>
                                    <div class="m-b-5">No.Of USERS Using Our web app</div><i class="ti-user widget-stat-icon"></i>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                                 
                                    
                            <img src="../images/home gif.gif" class="img-responsive mx-auto d-block" width="500px" alt="Home Gif"/>
                                        
                                 
                                   




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
<script src="./assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
<script src="./assets/vendors/jvectormap/jquery-jvectormap-2.0.3.min.js" type="text/javascript"></script>
<script src="./assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
<script src="./assets/vendors/jvectormap/jquery-jvectormap-us-aea-en.js" type="text/javascript"></script>
<!-- CORE SCRIPTS-->
<script src="assets/js/app.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL SCRIPTS-->
<script src="./assets/js/scripts/dashboard_1_demo.js" type="text/javascript"></script>
</body>

</html>