<%
    if (session.getAttribute("admin_name") == null) {
        response.sendRedirect("../adminlogin.jsp");
    }
%><%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.model.Custdetail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.org.dc.DAL"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SMART LAUNDRY | All Customers</title>
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
            <h1>ALL CUSTOMER</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">All Customer</li>
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
            <div class="card-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr style="text-align:center;">
                  <th>SR No.</th>
                  <th>Name</th>
                  <th>Mobile Number</th>
                  <th>Location</th>
                  <th>Building/chawl name</th>
                  <th>Room No.</th>
                  <th>Email</th>
                  <th>Password</th>
                  
                  <th>Delete</th>
                  
                </tr>
                </thead>
                
                
                
                  <%
                Custdetail c=new Custdetail();
                ArrayList<Custdetail> al =c.getAllcustomer();
                Iterator it=al.iterator();
                int s=0;
                while(it.hasNext()){
                    s++;
                    Custdetail c1=(Custdetail)it.next();
                    %>
                <tr style="text-align:center;">
                        <td><%=s%></td>
                        <td><%=c1.getCust_name()%></td>
                        <td><%=c1.getCust_contact()%></td>
                        <td><%=c1.getCust_location()%></td>
                        <td><%=c1.getCust_bldg_soc()%></td>
                        <td><%=c1.getRoom_flat_no()%></td>
                        <td><%=c1.getCust_email()%></td>
                        <td><%=c1.getCust_password()%></td>
                        <!--<td><a href="editcategory.jsp?cust_id=<%=c1.getCust_id()%>"><i class="fas fa-edit"></i> Edit</a></td>-->
                        <td><a href="delect_customer.jsp?cust_id=<%=c1.getCust_id()%>"><i class="fas fa-trash-alt"></i> </a></td>
                        
                    </tr>
                
              <%
                }
            %>
                
              </table>
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
