


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Smart Laundry || Register page</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->

        <link rel="icon" type="image/png" href="images/LOGO.png">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

        <!-- Bootstrap CSS File -->
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="register/fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- Libraries CSS Files -->
        <link href="fontawesome-free-5.12.0-web/css/all.css" rel="stylesheet" type="text/css"/>

        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <!--<link href="lib/font-awesome/css/util.css" rel="stylesheet" type="text/css"/>-->
        <!-- Main Stylesheet File -->
        <link href="css/style.css" rel="stylesheet">


        <!-- register page -->


        <!-- Main css -->
        <link rel="stylesheet" href="register/css/style.css">

    </head>

    <body style="background-image:url(images/intro-bg.jpg);
          ">
                  
     
        



      <!-- Maincss -->
        <header id="header">

            <div id="topbar">

                <div class="social-links">
                    <a href="#" class="twitter"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="facebook"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="linkedin"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#" class="instagram"><i class="fab fa-instagram"></i></a>
                </div>

            </div>

            <div class="container-fluid">

                <div class="logo float-left">

                    <h1 class="text-light">
                        <a href="index.jsp" class="scrollto">
                            <span> <img src="images/laundry!.png" style="padding-left: 50px;"  width="300px"/></span>
                        </a>
                    </h1>


                </div>

                <nav class="main-nav float-right d-none d-lg-block">
                    <ul>
                        <li class="active"><a href="index.jsp#home">Home</a></li>
                        <li><a href="index.jsp#about">About Us</a></li>
                        <li><a href="index.jsp#services">Services</a></li>
                        <li><a href="index.jsp#pricing">Pricing</a></li>
                        <li><a href="index.jsp#footer">Contact Us</a></li>
                        <li class="drop-down  "><a href=""> <i class="fas fa-sign-in-alt fa-2x"></i></a>
                            <ul>
                                <li><a href="custlogin.jsp">Sign In</a></li>
                                <li><a href="custregister.jsp">Sign Up</a></li>
                            </ul>
                        </li>

                    </ul>
                </nav><!-- .main-nav -->

            </div>
        </header><!-- #header -->


        <div class="main">

            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                            <form   action="Custregister" method="post"  >
                                <div class="form-group">
                                    <label ><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="cust_name"  id="c_name" placeholder="Your Name" required/>
                                <div id="name_error"></div></div>
                                
                                
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="cust_email" id="c_email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"  title="Example-abc@gmail.com" required placeholder="Your Email" />
                                    
                                </div>
                                <div id="email_error"></div>
                                <div class="form-group">
                                    <label ><i class="zmdi zmdi-home"></i></label>
                                    <input type="text" name="cust_location" id="c_location" placeholder="Enter you location" required/>
                                </div>
                                <div id="location_error"></div>
                                
                                <div class="form-group">
                                    <label ><i class="zmdi zmdi-home"></i></label>
                                    <input type="text" name="cust_bldg_soc" id="c_bldg" placeholder=" Building/Chwal Name" required/>
                                </div>
                                <div id="bldg_error"></div>
                                
                                <div class="form-group">
                                    <label ><i class="zmdi zmdi-home"></i></label>
                                    <input type="text" name="room_flat_no" id="c_room" placeholder=" Room no" required/>
                                </div>
                                 <div id="room_no_error"></div>
                                
                                <div class="form-group">
                                    <label ><i class="zmdi zmdi-phone"></i></label>
                                    <input type="text" name="cust_contact" id="c_contact" pattern="[789][0-9]{9}" title="number should be 10 digit"  required placeholder="Mobile Number" />
                                </div>
                                  <div id="contact_error"></div>
                                 
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="cust_password"  id="pass1" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Example- Abc@123" placeholder="Password" />
                                </div>
                                   <div id="password_error"></div>
                                  
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="custc_password" id="pass2"   required placeholder="Password" />
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required/>
                                    <label for="agree-term" class="label-agree-term"><span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit"  class="form-submit"  value="Register"/>
                                </div>
                            </form>
                        </div>

                        <div class="signup-image">

                            <figure>

                                <img src="images/signup-image.jpg" alt=""/>
                            </figure>
                            <a href="custlogin.jsp" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <footer >
            <div class="footer">
                <div class="rights" style="padding-left: 40%;">
                    &copy; Copyright <strong>SMART LAUNDRY</strong>. All Rights Reserved
                </div>
                <div style="padding-left: 43%;">

                    Designed by <a href="adminlogin.jsp">GIRISH MUSHAM</a>
                </div>
            </div>
        </footer><!-- #footer -->

        <script src="js/main.js"></script>
        <!-- register page -->
        <script>
            
		
                window.onload = function () {
			document.getElementById("pass1").onchange = validatePassword;
			document.getElementById("pass2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("pass2").value;
			var pass1 = document.getElementById("pass1").value;
			if (pass1 != pass2)
				document.getElementById("pass2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("pass2").setCustomValidity('');
			//empty string means no validation error
		}
                
                

	
            </script>
        <script src="register/vendor/jquery/jquery.min.js"></script>
        <script src="register/js/main.js"></script>

        <!-- Main page js-->
        <!-- JavaScript Libraries -->
        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/jquery/jquery-migrate.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/mobile-nav/mobile-nav.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="fontawesome-free-5.12.0-web/js/all.js" type="text/javascript"></script>
        <!-- Contact Form JavaScript File -->
        <script src="contactform/contactform.js"></script>

        <!-- Template Main Javascript File -->
        <script src="js/main.js"></script>
        <script src="document.querySelector('body > section:nth - child(8)')" ></script>
    </body>
</html>
