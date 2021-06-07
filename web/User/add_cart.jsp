
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.model.Clothdetail"%>
<%--<%
    if (session.getAttribute("cust_name") == null) {
        response.sendRedirect("../custlogin.jsp");
    }
%>--%>



<%@page import="java.text.DateFormat"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Smart Laundry || Request Order</title>

        <link rel="icon" type="image/gif" width="" href="../images/giphy.gif">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />

        <!-- GLOBAL MAINLY STYLES-->
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" rel="stylesheet" />
       
        <!-- PLUGINS STYLES-->
        <link href="./assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />
        <!-- THEME STYLES-->
        <link href="assets/css/main.min.css" rel="stylesheet" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- PAGE LEVEL STYLES-->
    </head>

    <body class="fixed-navbar">
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="index.jsp">

                        <img src="../images/LOGO_1.png" width="50px" alt=""/>
                        <span class="brand">Smart 
                            <span class="brand-tip"><span>Laundry</span>
                            </span>
                            <span class="brand-mini"> </span>
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


                        <li class="dropdown dropdown-user">
                            <a class="nav-link dropdown-toggle link" data-toggle="dropdown">

                                <img src="./assets/img/admin-avatar.png" />
                                <span></span><%=session.getAttribute("cust_name")%><i class="fa fa-angle-down m-l-5"></i></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="profile.html"><i class="fa fa-user"></i>Profile</a>
                                <a class="dropdown-item" href="profile.html"><i class="fa fa-cog"></i>Settings</a>
                                <a class="dropdown-item" href="javascript:;"><i class="fa fa-support"></i>Support</a>
                                <li class="dropdown-divider"></li>
                                <a class="dropdown-item" href="login.html"><i class="fa fa-power-off"></i>Logout</a>
                            </ul>
                        </li>
                    </ul>
                    <!-- END TOP-RIGHT TOOLBAR-->
                </div>
            </header>
            <!-- END HEADER-->
            <!-- START SIDEBAR-->
            <nav class="page-sidebar" id="sidebar">
                <div id="sidebar-collapse">
                    <div class="admin-block d-flex">
                        <div>
                            <img src="../images/Admin.gif"  width="150px" class="img-circle" alt="Admin "/> 
                        </div>
                        <div class="admin-info">
                            <div class="font-strong"><br><%=session.getAttribute("cust_name")%> </div><small>Admin</small></div>
                    </div>
                    <ul class="side-menu metismenu">


                        <li>
                            <a href="#"><i class="sidebar-item-icon fad fa-tshirt"></i>
                                <span class="nav-label">User Profile</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="colors.html">Colors</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>


                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                                <span class="nav-label">Your Orders</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="form_basic.html">Basic Forms</a>
                                </li>
                                <li>
                                    <a href="form_advanced.html">Advanced Plugins</a>
                                </li>
                                <li>
                                    <a href="form_masks.html">Form input masks</a>
                                </li>
                                <li>
                                    <a href="form_validation.html">Form Validation</a>
                                </li>
                                <li>
                                    <a href="text_editors.html">Text Editors</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-table"></i>
                                <span class="nav-label">Your Wish</span><i class="fa fa-angle-left arrow"></i></a>

                        </li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-bar-chart"></i>
                                <span class="nav-label">Your Account</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="charts_flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="charts_morris.html">Morris Charts</a>
                                </li>
                                <li>
                                    <a href="chartjs.html">Chart.js</a>
                                </li>
                                <li>
                                    <a href="charts_sparkline.html">Sparkline Charts</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-map"></i>
                                <span class="nav-label">Customer Service</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="maps_vector.html">Vector maps</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="icons.html"><i class="sidebar-item-icon fa fa-smile-o"></i>
                                <span class="nav-label">Icons</span>
                            </a>
                        </li>
                        <li class="heading">PAGES</li>


                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-file-text"></i>
                                <span class="nav-label">Pages</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="invoice.html">All Invoice</a>
                                </li>



                                <li>
                                    <a href="forgot_password.html">Forgot password</a>
                                </li>

                            </ul>
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
                <!-- START PAGE CONTENT-->
                <div class="page-heading">
                    <h1 class="page-title">Request an order</h1>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="la la-home font-20"></i></a>
                        </li>

                        <li class="breadcrumb-item"><a href="" style="text-decoration: #000">Home</a> / <a href="">Request Orders</a></li>
                    </ol>
                </div>
                <br>
                <br>




                <div class="container">
                    <style> .table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
        }</style>
                    <div class="card">
                        <div>
                            <form action="../AddOrder" method="post">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="">Product</th>
                                                        <th style="width:10%">Cloth Names</th>
							<th style="width:10%">Quantity</th>
							
                                                         <%
                                                            if(session.getAttribute("cloth_name") != null){
                                                                %>
                                                            
                                                        <th style="width:22%" class="text-center">Subtotal</th>
                                                        <%
                                                            }
                                                                %>
							
							<th style="width:10%">Amount</th>
                                                        
						</tr>
					</thead>
					<tbody>
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin">Product 1</h4>
										<p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
									</div>
								</div>
							</td>
							<td data-th="cloth name">
                                                            <select class="form-control"  name="rate"   required>
                                                <option value="">Select</option>
                                                <%        
                                                    Clothdetail c = new Clothdetail();
                                                    ArrayList<Clothdetail> al = c.getAllclothdetail();
                                                    Iterator it = al.iterator();

                                                    while (it.hasNext()) {

                                                        Clothdetail c1 = (Clothdetail) it.next();
                                                %>
                                                <option value="<%=c1.getIron_rate() %>" > <%=c1.getCloth_name()%></option>
                                                
                                                <%
                                                    }
                                                %>

                                            </select>
                                                        </td>
							<td data-th="Quantity">
								<input type="text" name="cloth_qty" class="form-control text-center" required>
							</td>
                                                        <%
                                                            if(session.getAttribute("cloth_name") != null){
                                                                %>
                                                            
                                                        <td data-th="Total Amout" class="text-center"><%=session.getAttribute("net_ayable")%></td>
                                                        <%
                                                            } 
                                                                else
                                                                        {

                                                                %>
                                                                <td data-th="Total Amout" class="text-center">00.00$</td>
                                                                <%
                                                                    }
                                                                %>
							<td class="actions" data-th="">
								<button class="btn btn-info btn-sm"><i class="fas fa-user"></i></button>
								<button class="btn btn-danger btn-sm"><i class="far fa-rupee"></i></button>								
							</td>
						</tr>
					</tbody>
					<tfoot>
						
						<tr>
							<td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
                                                        <%
                                                            if(session.getAttribute("net_payable")!=null)
                                                            {
                                                                %>
                                                        <td  class="hidden-xs  text-center"><strong>Total <%=session.getAttribute("net_payable")%> <i class="fad fa-rupee"></i></strong></td>
                                                        <%
                                                            }
                                                                else
                                                                        {
                                                                %>
                                                        <td  class="hidden-xs  text-center"><strong>Total 00.00<i class="fas fa-rupee"></i></strong></td>
                                                        <%
                                                            }
                                                                    %>
                                                        
                                                        
							<td><a href="#" class="btn btn-success btn-flex">Checkout <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
                            </form>
                    </div>
                </div>











                <!-- END PAGE CONTENT-->
                <footer class="page-footer">
                    <div class="font-13">2018 © <b>AdminCAST</b> - All rights reserved.</div>
                    <a class="px-4" href="http://themeforest.net/item/adminca-responsive-bootstrap-4-3-angular-4-admin-dashboard-template/20912589" target="_blank">BUY PREMIUM</a>
                    <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
                </footer>
            </div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js" type="text/javascript"></script>https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js
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


</html>