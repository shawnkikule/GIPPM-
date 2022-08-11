<%-- 
    Document   : customers
    Created on : Aug 8, 2022, 10:38:30 PM
    Author     : HP
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
                    ResultSet res= null;
                    
                    //locations
                    ResultSet cent = null;
                 
                    ResultSet east = null;
                  
                    ResultSet north = null;
                    
                    ResultSet west = null;
                   
                    
                    //preferences (by demand)
                    ResultSet most = null;
              
                    ResultSet least = null;
            
                    
                    //likes
                    ResultSet like=null;
                  
                    ResultSet llike=null;
               
                    
                    //Gender:Make
                    ResultSet xmilk=null;

                    ResultSet xghee=null;
               
                    ResultSet xbutr=null;
               
                    ResultSet xyorg=null;
             
                    
                    //Gender: Female
                    ResultSet ymilk=null;
        
                    ResultSet yghee=null;
            
                    ResultSet ybutr=null;
             
                    ResultSet yyorg=null;
                    String r1=null;
                    String r2=null;
                    String r3=null;
                    String r4=null;
                    String r5=null;
                    String r6=null;
                    String r7=null;
                    String r8=null;
                    String r9=null;
                    String r10=null;
                    String r11=null;
                    String r12=null;
                    String r13=null;
                    String r14=null;
                    String r15=null;
                    String r16=null;
                    String r17=null;
                    String r18=null;
         
                    
                    
                    String name = null;
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
                
                    west=  checkdb.executeQuery("select count(region) as w from customers where region='Western'");
                    while(
                           
                           
                           west.next()){
                           r16= west.getString("w");
                     
                    }               
                 
                    cent=  checkdb.executeQuery("select count(region) as c from customers where region='Central'");
                    while(
                           
                           
                           cent.next()){
                           r13= cent.getString("c");
                     
                    }               
                 
                    east=  checkdb.executeQuery("select count(region) as e from customers where region='Eastern'");
                    while(
                           
                           
                           east.next()){
                          r14= east.getString("e");
                     
                    }               
                 
                    north=  checkdb.executeQuery("select count(region) as n from customers where region='Northern'");
                    while(
                           
                           
                           north.next()){
                           r15= north.getString("n");
                     
                    }               
                 
                    like=  checkdb.executeQuery("select product_name from products where likes = (select max(likes) from products)");
                    while(
                           
                           
                           like.next()){
                           r3= like.getString("product_name");
                     
                    }               
                 
                    llike=  checkdb.executeQuery("select product_name from products where likes = (select min(likes) from products)");
                    while(
                           
                           
                           llike.next()){
                           r4= llike.getString("product_name");
                     
                    }               
                
                    most=  checkdb.executeQuery("select product_name from products where sales = (select max(sales) from products)");
                    while(
                           
                           
                           most.next()){
                           r1= most.getString("product_name");
                     
                    
                      
                    }               
                 
                    least=  checkdb.executeQuery("select product_name from products where sales = (select min(sales) from products)");
                    while(
                           
                           
                           least.next()){
                           r2= least.getString("product_name");
                 
                      
                    }               
                 
                    xmilk=  checkdb.executeQuery("select count(milk) as xm from orders inner join customers on gender='Male'");
                    while(
                           
                           
                           xmilk.next()){
                           r6= xmilk.getString("xm");
                     
                  
                      
                    }               
              
                    ymilk=  checkdb.executeQuery("select count(milk) as ym from orders inner join customers on gender='Female'");
                    while(
                           
                           
                           ymilk.next()){
                           r5= ymilk.getString("ym");
                     
                          
                    }               
                
                    xyorg=  checkdb.executeQuery("select count(yoghurt) as xy from orders left join customers on gender='Male'");
                    while(
                           
                           
                           xyorg.next()){
                           r12= xyorg.getString("xy");
                     
                      
                    }               
                
                    yyorg=  checkdb.executeQuery("select count(yoghurt) as yy from orders left join customers on gender='Female'");
                    while(
                           
                           
                           yyorg.next()){
                           r11= yyorg.getString("yy");
                     
                    }               
                 
                    xghee=  checkdb.executeQuery("select count(ghee) as xg from orders left join customers on gender='Male'");
                    while(
                           
                           
                           xghee.next()){
                           r10= xghee.getString("xg");
                     
                    }               
                 
                    yghee=  checkdb.executeQuery("select count(ghee) as yg from orders left join customers on gender='Female'");
                    while(
                           
                           
                           yghee.next()){
                           r9= yghee.getString("yg");
                     
                    }               
                 
                    xbutr=  checkdb.executeQuery("select count(butter) as xb from orders inner join customers on gender='Male'");
                    while(
                           
                           
                           xbutr.next()){
                           r8= xbutr.getString("xb");
                     
                    }               
                 
                    ybutr=  checkdb.executeQuery("select count(butter) as yb from orders inner join customers on gender='Female'");
                    while(
                           
                           
                           ybutr.next()){
                           r7= ybutr.getString("yb");
                     
                    }               
                
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
                           <h6><%out.println(name);%></h6>
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
                     
                     <li class ="active"><a href="#"><i class="fa fa-briefcase purple_color2"></i> <span>Customer base Tracking</span></a></li>

                     <li><a href="reports.jsp"><i class="fa fa-file-text yellow_color"></i> <span>Reports</span></a></li>
                     
                     <li><a href="../authentication/admin_signin.jsp"><i class="fa fa-sign-out red_color"></i> <span>Sign Out</span></a></li>

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
                              <h2>Customer Base Tracking and Advisory</h2>
                           </div>
                        </div>
                     </div>
                     <br>
                     <p>Preference Statistics</p>
                     <hr>
                     <div class="row column1 social_media_section">
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons fb margin_bottom_30">
                              <div class="social_icon-g">
                                 Most bought
                              </div>
                              <div class="social_cont">
                                 <ul>
                                    
                             
                                       <span><%
                         
                            out.println(r1);
                      
                               
                 %></span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons tw margin_bottom_30">
                              <div class="social_icon-g">
                                 Least bought
                              </div>
                              <div class="social_cont">
                                 <ul>
                                    
                                    <li>
                     
                                       <span><%
                     
                            out.println(r2);
                      
                            
                 %></span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons linked margin_bottom_30">
                              <div class="social_icon-g">
                                 Most <br> liked item
                              </div>
                              <div class="social_cont">
                                 <ul>
                                    
                                    <li>
                                       
                                        
                                       <span><%
                            out.println(r3);
                      
                            
                 %></span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons google_p margin_bottom_30">
                              <div class="social_icon-g">
                                 Least liked item
                              </div>
                              <div class="social_cont">
                                 <ul>
                                    
                                    <li>
                                       
                                        
                                       <span><%
                     
                            out.println(r4);
                               
                 %></span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                     <br>
                     <p>Gender statistics</p>
                     <hr>
                     <!-- row -->
                     <div class="row column1 social_media_section">
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons fb margin_bottom_30">
                              <div class="social_icon-g">
                                 UHT Milk
                              </div>
                              <div class="social_cont">
                                 <ul>
                                    <li>
                                       <span><strong><%
                            out.println(r5);
                      
                                   
                 %></strong></span>
                                       <span>Female</span>
                                    </li>
                                    <li>
                                       <span><strong><%out.println(r6);%></strong></span>
                                       <span>Male</span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons tw margin_bottom_30">
                              <div class="social_icon-g">
                                 Butter
                              </div>
                                       <div class="social_cont">
                                 <ul>
                                    <li>
                                       <span><strong><%out.println(r7);%></strong></span>
                                       <span>Female</span>
                                    </li>
                                    <li>
                                       <span><strong><%
                     
                            out.println(r8);
                              
                 %></strong></span>
                                       <span>Male</span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons linked margin_bottom_30">
                              <div class="social_icon-g">
                                 Ghee
                              </div>
                                       <div class="social_cont">
                                 <ul>
                                    <li>
                                       <span><strong><%
                     
                            out.println(r9);
                                
                 %></strong></span>
                                       <span>Female</span>
                                    </li>
                                    <li>
                                       <span><strong><%
                     
                            out.println(r10);
                          
                 %></strong></span>
                                       <span>Male</span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons google_p margin_bottom_30">
                              <div class="social_icon-g">
                                 Yoghurt
                              </div>
                                       <div class="social_cont">
                                 <ul>
                                    <li>
                                       <span><strong><%
                     
                            out.println(r11);
                               
                 %></strong></span>
                                       <span>Female</span>
                                    </li>
                                    <li>
                                       <span><strong><%
                     
                            out.println(r12);
                               
                 %></strong></span>
                                       <span>Male</span>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                     <br>
                     <p>Location Statistics</p>
                     <hr>
                     <div class="row column1 social_media_section">
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons fb margin_bottom_30">
                              <div class="social_icon-l">
                                 Central
                              </div>
                              <div class="social_conte">
                                 <ul>
                                    <li>
                                       <span><%
                     
                            out.println(r13);
                                  
                 %></span>
                                    
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons tw margin_bottom_30">
                              <div class="social_icon-l">
                                 Eastern
                              </div>
                              <div class="social_conte">
                                 <ul>
                                    <li>
                                       <span><%
                     
                            out.println(r14);
                             
                 %></span>
                                 
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons linked margin_bottom_30">
                              <div class="social_icon-l">
                                 Northern
                              </div>
                              <div class="social_conte">
                                 <ul>
                                 
                                    <li>
                                       <span><strong><%
                            out.println(r15);
                      
                 %></strong></span>
                                       
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full socile_icons google_p margin_bottom_30">
                              <div class="social_icon-l">
                                 Western
                              </div>
                              <div class="social_conte">
                                 <ul>
                                    
                                    <li>
                                       <span><strong><%
                     
                            out.println(r16);
                                 
                 %></strong></span>
                                    </li>
                                 </ul>
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
</html><!doctype html>