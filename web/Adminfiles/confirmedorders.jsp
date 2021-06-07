<%
    if (session.getAttribute("admin_name") == null) {
        response.sendRedirect("../adminlogin.jsp");
    }
%><%@page import="com.org.model.Orders"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.org.dc.DAL"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SMART LAUNDRY | Confirmed Orders</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->

  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

   <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <ul class="navbar-nav ml-auto">
      
        
      <li class="nav-item">
        <a class="nav-link"  href="admin_logout.jsp">
            
           <img src="../images/logout.png" width="20px" class="nav-icon" alt=""/> Logout
        </a>
      </li>
    </ul>
    
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index.jsp" class="brand-link">
        <img src="../images/laundry!_1.png" width="250px" alt=""/>
     
      
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      

      <!-- Sidebar Menu -->
     <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block"> <%=session.getAttribute("admin_name")%>
           </a>
        </div>
      </div>
          
          
         
          
          <!--Cloths-->
        <li class="nav-item has-treeview" >
            <a href="#" class="nav-link">
                <img src="../images/hoodie.png"  width="35px"  alt=""/>
              
              <p>
                Cloth
                <i class="fas fa-angle-left right"></i>
                </p>
            </a>
            <ul class="nav nav-treeview" style="padding-left: 10px;">
              <li class="nav-item">
                  <a href="allcloths.jsp" class="nav-link">
                        <img src="../images/list (1).png" class="nav-icon" alt=""/>
                  
                  <p>View All Cloths</p>
                </a>
              </li>
              <li class="nav-item">
                  <a href="addcloth.jsp" class="nav-link">
                 <img src="../images/add.png" class="nav-icon" alt=""/>
                  <p>Add Cloth</p>
                </a>
              </li>
             </ul>
             </li>
             
             
              <!--Cloths-->
            
           <!--Cloth category-->
           <li class="nav-item has-treeview"  >
            <a href="#" class="nav-link">
             <img src="../images/interface.png" width="35px" alt=""/>
              <p>
                Cloth category
                <i class="fas fa-angle-left right"></i>
                </p>
            </a>
            <ul class="nav nav-treeview" style="padding-left: 10px;">
              <li class="nav-item">
                  <a href="allcloth_category.jsp" class="nav-link">
                  <img src="../images/list (1).png" class="nav-icon" alt=""/>
                  <p> All Cloths Category</p>
                </a>
              </li>
              <li class="nav-item">
                  <a href="addcloth_category.jsp" class="nav-link">
                   <img src="../images/hanger.png" class="nav-icon" alt=""/>
                  <p>Add Cloth Category</p>
                </a>
              </li>
              
            </ul>
        </li>
          <!--Cloth category-->
         
          
              <!--Customer-->
           <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                
             <img src="../images/user.png" width="35px" alt=""/>
              <p>
                Customer
                <i class="fas fa-angle-left right"></i>
                </p>
            </a>
            <ul class="nav nav-treeview" style="padding-left: 10px;">
              <li class="nav-item">
                  <a href="allcustomer.jsp" class="nav-link">
                  <img src="../images/list (1).png" class="nav-icon" alt=""/>
                  <p> All Customer</p>
                </a>
              </li>
              
            
            </ul>
        </li>
          <!--Customer-->
          
         
         
            <!--Order-->
           <li class="nav-item has-treeview" >
            <a href="#" class="nav-link">
               <img src="../images/order list.png" width="35px" alt=""/>
          
              <p>
                Orders
                <i class="fas fa-angle-left right"></i>
                </p>
            </a>
            <ul class="nav nav-treeview" style="padding-left: 10px;">
              <li class="nav-item">
                  <a href="allorder.jsp" class="nav-link">
                <img src="../images/list (1).png" class="nav-icon" alt=""/>
                  <p> All Order</p>
                </a>
              </li>
             
            
            </ul>
        </li>
          <!--Order-->
          
          <hr>
          
          <!--feedback-->
                  <li class="nav-item has-treeview" >
            <a href="feedbacks.jsp" class="nav-link">
        
          <img src="../images/positive-vote.png" width="35px"alt=""/>
               <p>
                   Feedback
                </p>
            </a>
         
        </li>
          <!--feedback-->
          
          
          
          
       
          
          
          
          
      
          
          
          
          
       
          
          
          
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Orders</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">View</li>
              <li class="breadcrumb-item active">Order </li>
            </ol>
          </div>
            
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-body" style="background-color:">
                <a href="deliveredorders.jsp" class=" btn btn-primary" role="button">Delivered Orders</a>
                <a href="confirmedorders.jsp" class=" btn btn-primary" role="button">Change Order Status</a>
                <br><br>
               
                <div style="overflow-x:auto;">
                    <%--<%
                        DAL d=new DAL();
                        String sql= select order_id,
                        %>
                        
                
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr style="text-align: center;">
                  
                 
                  <th>Order ID </th>
                  <th>Order Date</th>
                  <th>Customer ID</th>
                  <th>CLOTH-CTID</th>
                  <th>CLOTH QTY</th>
                  <th>CLOTH NAME</th>
                  <th>PICK DATE</th>
                  <th>PICK TIME</th>
                  <th>DELIVERY DATE</th>
                  <th>DELIVERY TIME</th>
                  <th>PAY MODE</th>
                  <th>TOTAL AMOUNT</th>
                  <th>ORDER STATUS</th>
                  <th>DELETE</th>
                   </tr>
                </thead>
                <%@page import="com.org.model.Orders,java.sql.*,com.org.model.Custdetail,com.org.dc.DAL,java.util.*" %>
                
                 
                   <tr style="text-align:center;">
                         
                        
                       <td><a href="updateorder.jsp?order_id=<%=c1.getOrder_id()%>"><i class="fas fa-edit"></i>Edit</a></td>
                        <td><a href="deleteorder.jsp?order_id=<%=c1.getOrder_id()%>"><i class="fas fa-trash-alt"></i>Delete</a></td>
                        
                    </tr>
                 
                   
                
                
                
              </table>--%>
                     <table class="table table-striped table-bordered table-hover" id="example-table" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                 
                 
                                    
                                    <th>Sr No.</th>
                                    <th>Order id</th>
                                    <th>Order Date</th>
                                    <th>Customer id</th>
                                    <th>Cloth Cat-id</th>
                                    <th>Cloth Quantity</th>
                                    <th>Cloth Name</th>
                                    <th>Pick-Up Date</th>
                                    <th>Delivery Date</th>
                                    <th>Pick-Up Time</th>
                                    <th>Delivery Time</th>
                                    <th>Total Time</th>
                                    <th>Order Status</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                    
                                     
                                     
                                </tr>
                            </thead>
                           
                            <tbody>
                                <%
                                   
                                    DAL d=new DAL();
                                    String sql = "select order_id , cloth_qty , cust_id , cc_id , cloth_name , total_amount , order_status ,"
                                                + "order_date , payment_mode,"
                                                + "DATE_FORMAT( pick_up_date, '%d/%m/%Y') as pick_up_date,  "
                                                + " TIME_FORMAT(pick_up_time, '%h:%i %p') as pick_up_time,"
                                                + " DATE_FORMAT( delivery_date, '%d/%m/%Y') as delivery_date,"
                                                + " TIME_FORMAT(delivery_time, '%h:%i %p') as delivery_time "
                                                + "FROM orders where order_status= 'confirmed' ";
                                    //out.println(sql);
                                   ResultSet rs= d.executeQuery(sql);
                                   int s=0;
                                  while(rs.next())
                                  {
                                  s++;
                                     %>
                                    
                                <tr>
                                    <td><%= s%></td>
                                    <td><%=rs.getString("order_id")%></td>
                                    <td><%=rs.getString("order_date")%></td>
                                    <td><%=rs.getString("cust_id")%></td>
                                    <td><%=rs.getString("cc_id")%></td>
                                    <td><%=rs.getString("cloth_qty")%></td>
                                    <td><%=rs.getString("cloth_name")%></td>
                                    <td><%=rs.getString("pick_up_date")%></td>
                                    <td><%=rs.getString("delivery_date")%></td>
                                    <td><%=rs.getString("pick_up_time")%></td>
                                    <td><%=rs.getString("delivery_time")%></td>
                                    <td><%=rs.getString("total_amount")%></td>
                                    <td><%=rs.getString("order_status")%></td>
                                  
                                        
                                    <td><a href="updateorder.jsp?order_id=<%=rs.getString("order_id")%>"><i class="fas fa-edit"></i>Edit</a></td>
                                     <td><a href="deleteorder.jsp?order_id=<%=rs.getString("order_id")%>"><i class="fas fa-trash-alt"></i>Delete</a></td>

                                
                                </tr>
                             <%
                                  }
                                     %>
                               
                            </tbody>
                        </table>
            </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->

       
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer" >
    <div class="float-right d-none d-sm-block" style="padding-right:10px;">
        <img src="../images/311bbca247b777bdd43129a7b6cf4404.gif" width="50px" alt=""/>
    </div>
    <strong>Copyright © 2020-2021 <a href="#">SMART LAUNDRY</a> </strong> All rights
    reserved.<br>
    
  </footer>
  

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
