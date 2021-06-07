
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.org.dc.DAL"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <!-- GLOBAL MAINLY STYLES-->
    <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <!-- PLUGINS STYLES-->
    <!-- THEME STYLES-->
    <link href="assets/css/main.min.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES-->
</head>

<body >
    <%
                       int Order_id = Integer.parseInt(request.getParameter("order_id"));

                           DAL d = new DAL();

                           String sql = "select order_id , cloth_qty , cc_id , cloth_name , total_amount , order_status ,"
                                   + "   order_date , payment_mode,"
                                   + "DATE_FORMAT( pick_up_date, '%d-%m-%Y') as pick_up_date,  "
                                   + " TIME_FORMAT(pick_up_time, '%h:%i %p') as pick_up_time,"
                                   + " DATE_FORMAT( delivery_date, '%d-%m-%Y') as delivery_date,"
                                   + " TIME_FORMAT(delivery_time, '%h:%i %p') as delivery_time "
                                   + "FROM orders "
                                   + "where order_id=" + Order_id;

                           ResultSet rs = d.executeQuery(sql);
                           rs.next();
                           String cc_id = rs.getString("cc_id");
                           String order_date=rs.getString("order_date");

                                    
                           
                                %>
        
     
 
            <!-- START PAGE CONTENT-->
            <div>
            <div class="page-content fade-in-up">
                <div class="ibox invoice">
                    <div class="invoice-header">
                        <div class="row">
                            <div class="col-6">
                                <div class="invoice-logo">
                                   
                                    <img src="../images/laundry!_1.png" width="300px" height="150px" alt=""/>
                                </div>
                                <div>
                                    <div class="m-b-5 font-bold">Invoice from</div>
                                   
                                    <ul class="list-unstyled m-t-10">
                                        <li class="m-b-5">
                                            <span class="font-strong">A:</span> adeshwar tower,narpoli,bhiwandi-421305</li>
                                        <li class="m-b-5">
                                            <span class="font-strong">W:</span> admin@gmail.com</li>
                                        <li>
                                            <span class="font-strong">P:</span>+918234567890</li>
                                    </ul>
                                </div>
                            </div>
                            <%    
                                    Date date = new Date();
                                    SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy");
                                    String stringDate = DateFor.format(date);
                                %>
                            <div class="col-6 text-right">
                                <div class="clf" style="margin-bottom:30px;">
                                    <dl class="row pull-right" style="width:250px;"><dt class="col-sm-6">Invoice Date</dt>
                                        <dd class="col-sm-6"><%=stringDate%></dd><dt class="col-sm-6">Order Date</dt>
                                        <dd class="col-sm-6"><%=order_date%></dd><dt class="col-sm-6">Order No.</dt>
                                        <dd class="col-sm-6"><%=rs.getString("order_id")%></dd>
                                    </dl>
                                </div>
                                <div>
                                    <div class="m-b-5 font-bold">Invoice To</div>
                                    <div><%=session.getAttribute("cust_name")%></div>
                                    <ul class="list-unstyled m-t-10">
                                        <li class="m-b-5">Customet Id-<%=session.getAttribute("cust_id")%>,</li>
                                         <li class="m-b-5">Society name-<%=session.getAttribute("cust_bldg_soc")%>,</li>
                                        <li class="m-b-5">Room No.-<%=session.getAttribute("cust_room_no")%>,</li>
                                        <li class="m-b-5">Email-<%=session.getAttribute("cust_email")%>,</li>
                                        <li>Customer Conatact-<%=session.getAttribute("cust_contact")%>.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-invoice">
                        <thead>
                            <tr>
                                <th>Item Description</th>
                                <th> Cloth Quantity</th>
                                <th>Laundry Price</th>
                                <th>iron_rate</th>
                                <th>Total Amount</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <strong> Cloth name:</strong> <%=rs.getString("cloth_name")%>, 
                                    <strong>Cloth Quantity: </strong><%=rs.getString("cloth_qty")%><br>
                                    <strong>Cloth material ID: </strong><%=cc_id%><br>
                                    <strong>Pick Up Time: </strong><%=rs.getString("pick_up_time")%><br>
                                    <strong>Delivery Time: </strong><%=rs.getString("delivery_time")%><br>
                                    <strong>Pick Up Date: </strong><%=rs.getString("pick_up_date")%><br>
                                    <strong>Delivery Date: </strong><%=rs.getString("pick_up_date")%><br>
                                    </small></td>
                                    <td><%=rs.getString("cloth_qty")%></td>
                                     <%
                                    String sqa="select laundry_price , iron_rate  "
                                            + "from cloth_category "
                                            + "where cc_id=" + cc_id;
                                    ResultSet ra= d.executeQuery(sqa);
                                    ra.next();
                                    %>
                                    
                           <td><%=ra.getString("laundry_price")%></td>
                                <td><%=ra.getString("iron_rate")%></td> 
                               <td><%=rs.getString("total_amount")%> <i class="fa fa-rupee"></i></td>
                                
                              
                            </tr>
                                
                          
                        </tbody>
                    </table>
                    <table class="table ">
                        <thead>
                            <tr>
                                <th></th>
                                <th width="15%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="text-right">
                                <td>Subtotal:</td>
                                <td><%=rs.getString("total_amount")%> <i class="fa fa-rupee"></i></td>
                            </tr>
                            <tr class="text-right">
                                <td>TAX 5%:</td>
                                <td></td>
                            </tr>
                            <tr class="text-right">
                                <td class="font-bold font-18">TOTAL:</td>
                               <td><%=rs.getString("total_amount")%> <i class="fa fa-rupee"></i></td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>
                
                
            </div>
            <!-- END PAGE CONTENT-->
            </div>

    
    <!-- BEGIN THEME CONFIG PANEL-->
    
    <!-- END THEME CONFIG PANEL-->
    <!-- BEGIN PAGA BACKDROPS-->
   
    <!-- END PAGA BACKDROPS-->
    <!-- CORE PLUGINS-->
    <script src="./assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS-->
    <!-- CORE SCRIPTS-->
    <script src="assets/js/app.min.js" type="text/javascript"></script>
     <script type="text/javascript"> 
  window.addEventListener("load", window.print());
</script>
    <!-- PAGE LEVEL SCRIPTS-->
</body>

</html>