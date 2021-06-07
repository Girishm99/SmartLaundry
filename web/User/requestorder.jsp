<% 
    if(session.getAttribute("cust_name")== null){
    response.sendRedirect("../custlogin.jsp");
}
%>

<%@page import="com.org.model.Clothdetail"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.org.dc.DAL"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.model.Clothcategory"%>
<%@page import="com.org.model.Clothcategory"%>



<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Smart Laundry || Orders</title>

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
        <link href="assets/css/Booking order.css" rel="stylesheet" type="text/css"/>
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
            
            
                <div class="content-wrapper" >
                         <style style="text/css">
        .bounce {
            height: 30px;
            overflow: hidden;
            position: relative;
            background: transparent;
            color: #66afe9;
            font-family:            
        }
        
        .bounce p {
            position: absolute;
            width: 100%;
            height: 100%;
            margin: 0;
            line-height: 30px;
            
            text-align: center;
            -moz-transform: translateX(50%);
            -webkit-transform: translateX(50%);
            transform: translateX(50%);
            -moz-animation: bouncing-text 50s linear infinite alternate;
            -webkit-animation: bouncing-text 50s linear infinite alternate;
            animation: bouncing-text 30s linear infinite alternate;
        }
        
        @-moz-keyframes bouncing-text {
            0% {
                -moz-transform: translateX(50%);
            }
            100% {
                -moz-transform: translateX(-50%);
            }
        }
        
        @-webkit-keyframes bouncing-text {
            0% {
                -webkit-transform: translateX(50%);
            }
            100% {
                -webkit-transform: translateX(-50%);
            }
        }
        
        @keyframes bouncing-text {
            0% {
                -moz-transform: translateX(50%);
                -webkit-transform: translateX(50%);
                transform: translateX(50%);
            }
            100% {
                -moz-transform: translateX(-50%);
                -webkit-transform: translateX(-50%);
                transform: translateX(-50%);
            }
        }
    </style>

    <div class="bounce">
        <p> Laundry Service available form 7:00 AM to 10:00 PM </p>
    </div>
    <br>
                <!-- START PAGE CONTENT-->
                <div class="page-heading">
                    <h1 class="page-title">Your Orders</h1>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="la la-home font-20"></i></a>
                        </li>

                        <li class="breadcrumb-item"><a href="" style="text-decoration: #000">Home</a> / <a href="">Your Orders</a></li>
                    </ol>
                </div>
                <br>
                <br>
             






                <div class="container">
                    <div class="row">
                        <div class="booking-form" style="background-color:  ">
                            <div class="booking-bg" style="
                                 display:flex;
                                 align-items:center;
                                 ">



                                <img src="../images/c03417ebf4f447610528b07a704e0540.gif" alt=""/>

                            </div>
                            <form action="../AddOrder" method="post">
                                <div class="form-header">
                                    <h2>Request A Service</h2>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <span class="form-label">Cloth material</span>
                                            <select class="form-control" required name="cc_id">
                                                <option>select</option>
                                                <%-- <% 
                                                     if(session.getAttribute("cust_id")==null){
                                                }%>--%>


                                                <%
                                                    Clothcategory c = new Clothcategory();
                                                    ArrayList<Clothcategory> al = c.getAllclothcategory();
                                                    Iterator it = al.iterator();

                                                    while (it.hasNext()) {

                                                        Clothcategory c1 = (Clothcategory) it.next();
                                                %>
                                                <option value="<%=c1.getCc_id()%> " > <%=c1.getCc_name()%></option>


                                                <%
                                                    }
                                                %>

                                            </select> <span class="select-arrow"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <span class="form-label">Cloth type</span>
                                             <select class="form-control" name="cloth_name">
                                                <option>select</option>
                                                <%--<%  // out.println(session.getAttribute("cust_id"));
                                                    String Cc_id = (request.getParameter("cc_id"));
                                                    DAL d = new DAL();
                                                    int cust_id=1;
                                                    HttpSession s = request.getSession(true);
                                                    s.setAttribute("cust_id", cust_id);
                                                    String sql = "SELECT cloth_detail.cloth_name,cloth_detail.cloth_id "
                                                            + "FROM cloth_detail INNER JOIN cloth_category "
                                                            + "on cloth_detail.cc_id=cloth_category.cc_id "
                                                            + "where cloth_detail.cc_id=" + Cc_id;
                                                    ResultSet rs = d.executeQuery(sql);
                                                    while (rs.next()) {


                                                %>  
                                                <option value="<%=rs.getString("cloth_name")%>"> <%=rs.getString("cloth_name")%></option>
                                                <%
                                                    }
                                                %>--%>
                                                 <%
                                                    Clothdetail cn = new Clothdetail();
                                                    ArrayList<Clothdetail> all = cn.getAllclothdetail();
                                                    Iterator itc = all.iterator();

                                                    while (itc.hasNext()) {

                                                        Clothdetail c2 = (Clothdetail) itc.next();
                                                %>
                                                <option value="<%=c2.getCloth_name()%> " > <%=c2.getCloth_name()%></option>


                                                <%
                                                    }
                                                %>
                                                 
                                            </select><span class="select-arrow"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <span class="form-label">Pick-up Date</span>

                                            <input type="date" class="form-control" name="pick_up_date">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <span class="form-label">Delivery Date</span>

                                            <input type="date" class="form-control" name="delivery_date">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <span class="form-label">Pick-up Time</span>

                                            <input type="time"  class="form-control" name="pick_up_time" min="07:00" max="22:00" required >
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <span class="form-label">Delivery Time</span>

                                            <input type="time"  class="form-control" name="delivery_time" min="07:00" max="22:00" required >
                                        </div>
                                    </div>
                                </div>
                                            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                       <span class="form-label">Number Of cloths</span>

                                <input type="text" class="form-control" name="cloth_qty" placeholder="Enter No. of Cloth" >

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <span class="form-label">Select payment </span>
                                                        <select class="form-control" required name="payment_mode">
                                                <option>Select</option>
                                                
                                           
                                                <option value="Cash on delivery " > Cash on delivery </option>
                                                <option value="Credit card">Credit card</option>
                                                <option value="Debit card">Debit card</option>
                                                </select> <span class="select-arrow"></span> 

                                                    </div>
                                                </div>
                                            </div>


                                               


                               
                                    <input class="checkbox" class="checkbox form-control"  name="iron_rate" value="7" type="checkbox"><span class="form-label">Include Ironing cloths</span>
<input  type="text" name="cust_email"  hidden class="form-control" value="<%=session.getAttribute("cust_email")%>">

                                    
                              
                                
                                

                                    <!--Hidden values-->
             <input  type="text" name="cust_id"  hidden class="form-control" value="<%=session.getAttribute("cust_id")%>">

                               
                    
                        
                    
                                <%    
                                    Date date = new Date();
                                    SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy");
                                    String stringDate = DateFor.format(date);
                                %>
                    <input  type="text" name="order_date" hidden class="form-control" value="<%= stringDate%>"><br>
                 



                                <div class="form-btn">
                                    <button class="btn btn-primary btn-lg btn-block">Book Now</button>
                                </div>

                                <div class="form-btn">
                                    <a href="" role="button" class="btn btn- btn-lg btn-block" >Cancel</a>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                    











                <!-- END PAGE CONTENT-->
                <footer class="page-footer">
                    <div class="font-13">2020 © <b>Smart Laundry</b> - All rights reserved.</div>
                <img src="../images/311bbca247b777bdd43129a7b6cf4404.gif" width="90px"  alt=""/>
            <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
            
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