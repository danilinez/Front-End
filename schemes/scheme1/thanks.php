<?php
if (isset($_REQUEST['contact'])) {
  $f_name = $_REQUEST['f_name'];
  $l_name = $_REQUEST['l_name'];
  $email = $_REQUEST['email'];
  $subject = $_REQUEST['subject'];
  $message = $_REQUEST['message'];


  $body = 'Name: ' . $f_name . ' ' . $l_name . ', Email: ' . $email . ', Subject: ' . $subject . ', Message: ' . $message . ' ';
  $headers = 'From: sales@cleansolarcity.com';
  mail('sales@cleansolarcity.com', $subject, $body, $headers);
}
if (isset($_REQUEST['quote'])) {
  $f_name = $_REQUEST['f-first-name'];
  $l_name = $_REQUEST['f-last-name'];
  $email = $_REQUEST['f-email'];


  $phone = $_REQUEST['f-phone'];
  $address = $_REQUEST['f-address'];
  $city = $_REQUEST['f-city'];
  $state = $_REQUEST['f-state'];
  $zcode = $_REQUEST['f-zcode'];
  $name = $_REQUEST['y-name'];
  $mail = $_REQUEST['y-email'];
  $yphone = $_REQUEST['y-phone'];


  $subject = 'Refferal Form';


  $body = 'Friends Name: ' . $f_name . ' ' . $l_name . ', Friends Email: ' . $email . ''
          . ', Phone: ' . $phone . ''
          . ', Address: ' . $address . ''
          . ', City: ' . $city . ''
          . ', State: ' . $state . ''
          . ', Zip Code: ' . $zcode . ''
          . ', Your Name: ' . $name . ''
          . ', Your Email: ' . $mail . ''
          . ', Your Phone: ' . $yphone . ''
          . ' ';
  $headers = 'From: sales@cleansolarcity.com';
  mail('sales@cleansolarcity.com', $subject, $body, $headers);
}
?><!DOCTYPE html>
<html lang="en">


  <!-- Mirrored from heatmaponline.com/html/intruder/intruder/about.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 15 May 2019 05:58:54 GMT -->
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="description" content="" />
    <meta name="keywords"
          content="creative, portfolio, agency, template, theme, designed, html5, html, css3, responsive, onepage" />
    <meta name="author" content="Set Private Limited" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title>Solar - Company</title>


    <!------------------------------------------
    Main CSS File
  <------------------------------------------>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/custom-animation.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">

    <!-- Favicon -->
    <link href="images/favicon.png" rel="shortcut icon" type="image/png">

  </head>

  <body>

    <div class="preloader" style="background-position: center center;"></div>

    <!-- Start Page Wrapper  -->
    <div class="page-wrapper">

      <!-- Header Section Start -->
      <header class="header header-style-2 clearfix">

        <div class="top-bar">
          <div class="container">
            <div class="row">
              <div class="col-md-8">
                <div class="contact-info">
                  <ul>
                    <li>
                      <i class="flaticon-flash"></i>
                      69/A MODEL TOWN GUJRANWALA
                    </li>
                  </ul>
                </div>
              </div>
              <div class="col-md-4">
                <div class="social-icons">
                  <ul>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="menu-style bg-transparent menu-hover-2  clearfix">
          <!-- main-navigation start -->
          <div class="main-navigation main-mega-menu animated">
            <nav class="navbar navbar-expand-lg navbar-light">
              <div class="container">
                <!-- header dropdown buttons end-->
                <a class="navbar-brand" href="index.html">
                  <img id="logo_img" src="images/logo.png" alt="">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbar-collapse-1" aria-controls="navbar-collapse-1" aria-expanded="false"
                        aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>


                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                  <!-- main-menu -->
                  <ul class="navbar-nav ml-xl-auto">

                    <li class="nav-item">
                      <a href="index.html" class="nav-link self-a">Home</a>
                    </li>
                    <li class="nav-item">
                      <a href="about.html" class="nav-link self-a">About</a>
                    </li>


                    <li class="nav-item dropdown">
                      <a href="solutions.html" class="nav-link dropdown-toggle">Solutions</a>
                      <div class="dropdown-menu left-1">
                        <div class="dropdown">
                          <a class="dropdown-item" href="resedential packages - solution.html">RESIDENTIAL PACKAGES</a>
                          <a class="dropdown-item" href="commercial-solar.html">COMMERCIAL SOLAR</a>
                          <a class="dropdown-item" href="industrial-solar.html">INDUSTRIAL SOLAR</a>
                          <a class="dropdown-item" href="solar-tubewells.html">SOLAR TUBEWELLS</a>
                        </div>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a href="product.html" class="nav-link self-a">Product</a>
                    </li>
                    <li class="nav-item">
                      <a href="blog.html" class="nav-link self-a">Blog</a>
                    </li>

                    <li class="nav-item">
                      <a href="contact.html" class="nav-link self-a">Contact</a>
                    </li>

                  </ul>
                </div>
              </div>
            </nav>
          </div>
          <!-- main-navigation end -->
        </div>

      </header>
      <!-- Header Section End -->

      <!-- Inner Section Start -->
      <section class="inner-area parallax-bg" data-background="images/bg/about.jpg" data-type="parallax" data-speed="3">
        <div class="container">
          <div class="section-content">
            <div class="row">
              <div class="col-12">
                <h4>Thank You</h4>
                <p>Home <a href="#">Thank You</a></p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Inner Section End -->

      <!-- Company Section Start -->
      <section class="company-section"  style="margin-top:50px">
        <div class="container">
          <div class="row about-features">
            <div class="col-md-12">
              <div class="content about-csc text-center">

                <h1>Your request has been received.</h1>
                <p class="p-text">We will get back to you as soon as possible.</p>

              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Company Section End -->



      <!-- Footer Style Seven Start -->
      <footer class="bg-faded pt-70 pb-40 bg-theme-color-2">
        <div class="container">
          <div class="section-content">
            <div class="row">
              <div class="col-lg-4 col-12">
                <div class="footer-item footer-widget-one">
                  <img class="footer-logo mb-25" src="images/logo.png" alt="">
                  <p>We at Clean Solar City mainly deal in Solar Panel, Solar Inverter & Deep Cycle Batteries.</p>
                  <hr>
                  <h6>Follow<span> Us</span></h6>
                  <ul class="social-icon bg-transparent bordered-theme">
                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-6 col-lg-3 offset-lg-1">
                <div class="footer-item">
                  <div class="footer-title">
                    <h4>Quick <span>Links</span></h4>
                    <div class="border-style-3"></div>
                  </div>
                  <ul class="footer-list">
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="solutions.html">Solutions</a></li>
                    <li><a href="product.html">Product</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="contact.html">Contact</a></li>
                  </ul>

                </div>
              </div>
              <div class="col-lg-4 col-md-6">
                <div class="footer-item">
                  <div class="footer-title">
                    <h4>Quick <span>Contact</span></h4>
                    <div class="border-style-3"></div>
                  </div>
                  <ul class="footer-list footer-contact mb-10">
                    <li><i class="pe-7s-call"></i> +92-55-3840094, +92-317-7189670</li>

                    <li><i class="pe-7s-mail"></i> <a href="mailto:sales@cleansolarcity.com">Email: sales@cleansolarcity.com</a></li>
                  </ul>
                  <div class="footer-item">
                    <h6>News <span>letter</span></h6>
                    <div class="input-group subscribe-style-two">
                      <input type="email" class="form-control input-subscribe" placeholder="Email">
                      <span class="input-group-btn">
                        <button class="btn btn-subscribe" type="button">Subscribe</button>
                      </span>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </footer>
      <section class="footer-copy-right bg-theme-color-2 text-white p-0">
        <div class="container">
          <div class="row">
            <div class="col-12 text-center">
              <p>© 2019, All Rights Reserved, Design & Developed By:<a href="http://lineztechnologies.com" target="_blank"> Linez Technologies</a></p>
            </div>
          </div>
        </div>
      </section>
      <!-- Footer Style Seven End -->

    </div>
    <!-- End Page Wrapper  -->

    <a href="#" class="scrollup"><i class="flaticon-long-arrow-pointing-up" aria-hidden="true"></i></a>


    <!------------------------------------------
    Main JavaScript
  <------------------------------------------>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


    <!-- Optional JavaScript -->
    <script src="js/bootstrap-dropdownhover.min.js"></script>
    <script src="js/bootstrap-slider.js"></script>
    <script src="js/jquery.flexslider-min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/css3-animate-it.js"></script>
    <script src="js/magnific-popup.min.js"></script>
    <script src="js/jquery.fancybox.js"></script>
    <script src="js/player-min.js"></script>

    <!-- Custom JavaScript -->
    <script src="js/script.js"></script>

  </body>


  <!-- Mirrored from heatmaponline.com/html/intruder/intruder/about.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 15 May 2019 05:59:18 GMT -->
</html>