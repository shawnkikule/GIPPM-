<%-- 
    Document   : reports
    Created on : Aug 3, 2022, 10:37:05 PM
    Author     : Mathias
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>GIPPM | Dashboard</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- site icon -->
      <link rel="icon" href="../images/favicon.ico" type="image/png" />
      <!-- bootstrap css -->
      <link rel="stylesheet" href="../css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="../style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="../css/responsive.css" />
      <!-- color css -->
      <link rel="stylesheet" href="../css/colors.css" />
      <!-- select bootstrap -->
      <link rel="stylesheet" href="../css/bootstrap-select.css" />
      <!-- scrollbar css -->
      <link rel="stylesheet" href="../css/perfect-scrollbar.css" />
      <!-- custom css -->
      <link rel="stylesheet" href="../css/custom.css" />
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
   </head>
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                      <%
                    Connection db_connect; 
                    Statement checkdb;
                    ResultSet res = null;
                    String name = null;
                    
                    //ResultSet command for customers table
                    ResultSet customers=null;
                    String cust=null;
                            
                    //ResultSet command for orders table
                    ResultSet orders=null;
                    String ord=null;
                    
                    //ResultSet command for staff table
                    ResultSet staff=null;
                    String stff=null;
                    
                    //ResultSet command for products table
                    ResultSet products=null;
                    String prod=null;
                 
            try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                } catch (ClassNotFoundException ex) {                    
                    out.println("Error loading driver because of "+ex.getMessage());
                    out.println(" ");
                }
            
            //2. Connecting to database. This is only successful if the JDBC driver is working
            try {    //Connecting to database 
                    db_connect = DriverManager.getConnection("jdbc:mysql://localhost:8000/gippm_db", "root", "password");                
                    out.println("Database connection is successful.");

                    
            //3. If database connection is successful, we can now issue an SQL statement to verify the admin
                    checkdb = db_connect.createStatement();
                   
                    res=  checkdb.executeQuery("select * from admin");
                   while(
                           
                           
                           res.next()){
                           name= res.getString(2);
                                           
                    }               
              
//                    
//                    
//                    customers = checkdb.executeQuery("select * from customers");
//                    
//                      while(
//                           
//                           
//                           customers.next()){
//                           cust= customers.getString("");
//                     
//                            out.println(cust);
//                      
//                    }               
//             
//                    
//                    products = checkdb.executeQuery("select * from products");
//                    
//                      while(
//                           
//                           
//                           products.next()){
//                           prod= products.getString("");
//                     
//                            out.println(prod);
//                      
//                    }               
//                    
//                    orders = checkdb.executeQuery("select * from orders");
//                    
//                      while(
//                           
//                           
//                           orders.next()){
//                           ord= orders.getString("");
//                     
//                            out.println(ord);
//                      
//                    }         
//                    
//                    staff = checkdb.executeQuery("select * from staff");
//                    
//                      while(
//                           
//                           
//                           staff.next()){
//                           stff= staff.getString("");
//                     
//                            out.println(staff);
//                      
//                    }               
//             
              
                    
                    %>
                     <div class="logo_section">
                       <img class="logo_icon img-responsive" src="../images/logo/logo_icon.png" alt="#" />
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <div class="user_img"><img class="img-responsive" src="../images/layout_img/admin.jpg" alt="#" /></div>
                        <div class="user_info">
                           <h6><%
                     
                            out.println(name);
                            
                 %></h6>
                           <p><span class="online_animation"></span> Online</p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                  <h4>Modules</h4>
                  <ul class="list-unstyled components">
                     <li><a href="../admin.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>

                     <li><a href="human_resource.jsp"><i class="fa fa-users orange_color"></i> <span>Human Resource</span></a></li>
                     
                     <li><a href="products.jsp"><i class="fa fa-shopping-cart green_color"></i> <span>Products and Sales</span></a></li>
                     
                     <li><a href="customers.jsp"><i class="fa fa-briefcase purple_color2"></i> <span>Customer base Tracking</span></a></li>

                     <li class="active"><a href="#"><i class="fa fa-file-text yellow_color"></i> <span>Reports</span></a></li>
                     
                     <li><a href="../../authentication/admin_signin.jsp"><i class="fa fa-sign-out red_color"></i> <span>Sign Out</span></a></li>

                  </ul>
               </div>
            </nav>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <div class="topbar">
                  <nav class="navbar navbar-expand-lg navbar-light">
                     <div class="full">
                        <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                        <div class="logo_section">
                           <img class="img-responsive" src="../images/logo/logo.png" alt="#" />
                        </div>
                        <div class="right_topbar">
                           <div class="icon_info">
                              <ul class="user_profile_dd">
                                 <li>
                                    <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../images/layout_img/admin.jpg" alt="#" /><span class="name_user"><%
                       
                            out.println(name);
                      
                                 
                 %></span></a>
                                    <div class="dropdown-menu">
                                       
                                       
                                       <a class="dropdown-item" href="../../authentication/signin.jsp"><span>Sign out</span> <i class="fa fa-sign-out"></i></a>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <!-- end topbar -->
               <!-- dashboard inner -->
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Reports</h2>
                           </div>
                        </div>
                     </div>

                      
                      <div class="col-md-12">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Pending Orders</h2>
                                 </div>
                              </div>
                              <div class="table_section padding_infor_info">
                                 <div class="table-responsive-sm">
                                    <table class="table">
                                       <thead>
                                          <tr>
                                             <th>Customer Name</th>
                                             <th>Order ID</th>
                                             <th>Amount</th>
                                             <th>Payment Method</th>
                                             <th>Status of order</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                              <td>
                                                  
                                                  
                                              </td>
                                             <td>
                                             
                                             
                                             </td>
                                             <td>
                                             
                                             
                                             </td>
                                             <td>
                                                 
                                                 
                                             </td>
                                             <td>
                                             
                                             
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                        </div>
                      
                      
                      <div class="col-md-12">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Customers</h2>
                                 </div>
                              </div>
                              <div class="table_section padding_infor_info">
                                 <div class="table-responsive-sm">
                                    <table class="table">
                                       <thead>
                                          <tr>
                                             <th>Customer ID</th>
                                             <th>First Name</th>
                                             <th>Last Name</th>
                                             <th>Gender</th>
                                             <th>Address</th>
                                             <th>Region</th>
                                             <th>Telephone</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                        </div>
                      
                      
                      <div class="col-md-12">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Products</h2>
                                 </div>
                              </div>
                              <div class="table_section padding_infor_info">
                                 <div class="table-responsive-sm">
                                    <table class="table">
                                       <thead>
                                          <tr>
                                             <th>Product ID</th>
                                             <th>Name</th>
                                             <th>Price</th>
                                             <th>Quantity</th>
                                             <th>Stock sold</th>
                                             <th>Production line</th>
                                             <th>Sales</th>
                                             <th>Likes</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                              <td>
                                                  
                                                  
                                              </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             <td>
                                             
                                             </td>
                                             
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                        </div>
                      
                      
                      <div class="col-md-12">
                           <div class="white_shd full margin_bottom_30">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>Staff</h2>
                                 </div>
                              </div>
                              <div class="table_section padding_infor_info">
                                 <div class="table-responsive-sm">
                                    <table class="table">
                                       <thead>
                                          <tr>
                                            
                                             <th>Staff ID</th>
                                             <th>Staff Name</th>
                                             <th>Allocation</th>
                                             
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                           
                                             <td>
                                             
                                             
                                             
                                             </td>
                                             <td>
                                             
                                             
                                             </td>
                                             <td>
                                             
                                             
                                             </td>
                                             
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                        </div>

                     
                  </div>
               </div>
               <% } catch (SQLException ex) {                    
                    out.println("Error! Failed to connect to the database because of "+ex.getMessage());
        }%>

               <!-- dashboard inner has a closing div after this comment -->
         </div>
      </div>
      <!-- jQuery -->
      <script src="../js/jquery.min.js"></script>
      <script src="../js/popper.min.js"></script>
      <script src="../js/bootstrap.min.js"></script>
      <!-- wow animation -->
      <script src="../js/animate.js"></script>
      <!-- select country -->
      <script src="../js/bootstrap-select.js"></script>
      <!-- owl carousel -->
      <script src="../js/owl.carousel.js"></script> 
      <!-- chart js -->
      <script src="../js/Chart.min.js"></script>
      <script src="../js/Chart.bundle.min.js"></script>
      <script src="../js/utils.js"></script>
      <script src="../js/analyser.js"></script>
      <!-- nice scrollbar -->
      <script src="../js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="../js/custom.js"></script>
      <script src="../js/chart_custom_style1.js"></script>
   </body>
</html>
