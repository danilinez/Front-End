<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Home - WheelHealthcare</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <meta charset="UTF-8" />

    <!-- <link rel="shortcut icon" href="assets/img/favicon.ico" />-->
    <link href="assets-new/plugins/twitter-bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets-new/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="assets-new/plugins/ResponsiveSlides.js/responsiveslides.min.css" rel="stylesheet"/>
    <link href="assets-new/plugins/jqueryui/css/jquery-ui.min.css" rel="stylesheet"/>
    <link href="assets-new/css/style.css" rel="stylesheet" />

    <!--[if lt IE 9]>
        <script src="assets-new/plugins/html5shiv/html5shiv.min.js"></script>
        <script src="assets-new/plugins/html5shiv/html5shiv-printshiv.min.js"></script>
        <script src="assets-new/plugins/respond.js/respond.min.js"></script>
        <script src="assets-new/js/matchMedia.min.js"></script>
    <![endif]-->

    <script src="assets-new/plugins/jquery/jquery.min.js"></script>
    <script src="assets-new/plugins/jqueryui/jquery-ui.min.js"></script>
    <script src="assets-new/plugins/jquery-migrate/jquery-migrate.min.js"></script>
    <script src="assets-new/plugins/twitter-bootstrap/js/bootstrap.min.js"></script>
    <script src="assets-new/plugins/ResponsiveSlides.js/responsiveslides.min.js"></script>
    <script src="assets-new/js/bootstrap-hover-dropdown.js"></script>
    <script src="assets-new/js/jquery.equalheights.js"></script>
    <script src="assets-new/plugins/jquery-scrolltofixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets-new/js/application.js"></script>
    <script type="text/javascript" src="reveal/jquery.reveal.js"></script>
    <script src="assets-new/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="reveal/reveal.css">

    <script type="text/javascript">
      window.onload = function () {
        $.ajax({
          type: "POST",
          url: "LinezWS_WHCS.asmx/FnDeafultMedicalList",
          data: "{}",
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function (response) {

            var result = response.d;
            var josonProductsData = jQuery.parseJSON("[" + result + "]");
            //var josonProductsData = response;
            var myHTML = '';

            for (var row = 0; row < Math.floor(josonProductsData[0].length); row++) {

              myHTML += '<li>' + josonProductsData[0][row].sName + '</li>'
            }

            document.getElementById("medicines").innerHTML = myHTML;

          },
          failure: function (msg) {
            alert(msg);
          }
        });



      }



      function Medicine(HrefValue) {

        var href = HrefValue;
        $.ajax({
          type: "POST",
          url: "LinezWS_WHCS.asmx/fnMedicinesList",
          data: "{'sHref':'" + href + "'}",
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function (response) {

            var result = response.d;
            var josonProductsData = jQuery.parseJSON("[" + result + "]");
            //var josonProductsData = response;
            var myHTML = '';

            for (var row = 0; row < Math.floor(josonProductsData[0].length); row++) {

              myHTML += '<li>' + josonProductsData[0][row].sName + '</li>'
            }


            document.getElementById("medicines").innerHTML = myHTML;

          },
          failure: function (msg) {
            alert(msg);
          }
        });

      }



      function submitForm() {
        var strName = document.getElementById("txtUsername");

        var strPassword = document.getElementById("txtPassword");



        if (strName.value.length < 1) {

          strName.focus();

          alert('Please enter username');

          return false;

        }

        if (strPassword.value.length < 1) {

          strPassword.focus();

          alert('Please enter password');

          return false;

        }


        fnValidateUser();

      }

      function fnValidateUser() {

        var param = new Object();

        //            txtUsername txtPassword
        param.sUsername = $('#txtUsername').val();
        param.sPassword = $('#txtPassword').val();
        return $.ajax({
          type: "POST",
          url: "LinezWS_WHCS.asmx/fnValidateUser",
          data: JSON.stringify(param),
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function (msg) {
            if (msg.d == "1") {
              document.WHCSLive.submit();
            }
            else {
              alert("Invalid Email/Password! Please Try Again.");
            }

          },
          failure: function (msg) {
            alert(msg);
          }
        });

      }
    </script>
  </head>
  <body>

    <section id="top-bar">
      <div class="container-fluid">
        <div class="row">

          <article class="col-sm-3">
            <a href="index.html" id="logo"><img src="assets-new/img/logowheel.jpeg" alt="" class="img-responsive"/></a>
          </article>
          <nav class="col-sm-9">
            <ul class="nav nav-tabs">
              <li role="presentation"><a href="#">Personal</a></li>
              <li role="presentation"><a href="#">Business</a></li>
              <li role="presentation" ><a href="contact_us.html">Contact Us</a></li>
            </ul>
            <ul class="list-inline">
              <li><a href="about_us.html">About WHC</a></li>
              <li><a href="careers.html" class="active">Careers</a></li>
            </ul>
          </nav>

          <div class="clearfix"></div>
        </div>
      </div>
    </section>


    <header id="header">
      <div class="container">
        <div class="row">

          <div class="col-sm-2 col-sm-offset-5">

            <button type="button" class="btn btn-info btn-sm btn-block">Login to myWHC</button>

          </div>
          <div class="col-sm-2"><a href="#" class="big-link" data-reveal-id="loginModel" style="text-decoration:none"><button type="button" class="btn btn-info btn-sm btn-block">Request Call Back</button></a></div>
          <div class="col-sm-3">

            <div class="input-group input-group-sm">
              <input type="text" class="form-control" placeholder="Search">
              <span class="input-group-btn">
                <button class="btn btn-info" type="button"><i class="fa fa-search"></i></button>
              </span>
            </div>
            <div class="clearfix"></div>
          </div>

        </div>
      </div>
      <div id="start-sticky-header"></div>
      <div class="header-sticky">
        <div class="container">
          <nav class="navbar navbar-default " role="navigation">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-menu">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand visible-xs-block" href="#none" data-toggle="collapse" data-target="#main-menu">Menu</a>
            </div>
            <div class="collapse navbar-collapse" id="main-menu">
              <ul class="nav navbar-nav">
                <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
                <li class="dropdown dropdown-large">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products & Services <span class="caret"></span></a>
                  <ul class="dropdown-menu dropdown-menu-large">
                    <li class="container">
                      <div class="row">

                        <div class="col-sm-4">
                          <ul class="list-unstyled"> <li class="dropdown-header">Products</li>
                            <li><a href="prescription_and_non-prescription_medicine.html">Prescription &amp; Non-Prescription Medicine</a></li>
                            <li><a href="dme_and_supplies.html">Durable Medical Equipment (DME) and Supplies</a></li>
                            <li><a href="compounding.html">Compounding</a></li></ul>
                        </div>
                        <div class="col-sm-4">
                          <ul class="list-unstyled">
                            <li class="dropdown-header">Services</li>
                            <li><a href="integrated_healthcare_cloud_technologies.html">Integrated Healthcare Cloud Technologies</a></li>
                            <li><a href="personalized_healthcare_for_all.html">Personalized Healthcare For All</a></li>
                            <li><a href="diabetes_education.html">Diabetes Education</a></li>
                            <li><a href="disease_management.html">Disease Management</a></li>
                            <li><a href="workers_compensation_pharmacy_solution.html">Workers&prime; Compensation Pharmacy Solution</a></li>
                          </ul>
                        </div>
                        <!-- <div class="col-sm-4">
                          <ul class="list-unstyled">
                            <li class="dropdown-header">Promotional Products</li>
                            <li><a href="promotional_products.html">All Promotional Products</a></li>
                            <li><a href="weight_loss_kit.html">Weight Loss Kit - $499</a></li>
                            <li><a href="vitamins_for_life.html">Vitamins for life - $499</a></li>
                            <li><a href="diaetic_kit.html">Diabetic Kit - $499</a></li>
                            <li><a href="smart_home_health_care_kit.html">Smart Home Health Care Kit - $499</a></li>
                            <li><a href="energy_saving_kit.html">Energy Saving Kit - $499</a></li>
                          </ul>
                        </div> -->
                      </div>
                    </li>
                  </ul>
                </li>
                <li class="dropdown dropdown-large"><a href="how_it_works.html" class="dropdown-toggle" data-toggle="dropdown">How It Works<span class="caret"></span></a>
               <ul class="dropdown-menu dropdown-menu-large">
                    <li class="container">
                      <div class="row">

                        <div class="col-sm-4">
                          <ul class="list-unstyled"> <li class="dropdown-header">Prescription Transfer</li>
                           <li><a href="how_it_works.html#prescriptiontransfer">Prescription Transfer</a></li>
                           <!--  <li><a href="dme_and_supplies.html">Durable Medical Equipment (DME) and Supplies</a></li>
                            <li><a href="compounding.html">Compounding</a></li>--></ul>
                        </div>
                        <div class="col-sm-4">
                          <ul class="list-unstyled">
                            <li class="dropdown-header">Payment Methods</li>
                           <li><a href="how_it_works.html#paymentmethods">Payment Methods</a></li>
                           <!--  <li><a href="personalized_healthcare_for_all.html">Personalized Healthcare For All</a></li>
                            <li><a href="diabetes_education.html">Diabetes Education</a></li>
                            <li><a href="disease_management.html">Disease Management</a></li>
                            <li><a href="workers_compensation_pharmacy_solution.html">Workers&prime; Compensation Pharmacy Solution</a></li>-->
                          </ul>
                        </div>
                        <div class="col-sm-4">
                          <ul class="list-unstyled">
                            <li class="dropdown-header">Delivery Options</li>
                            <li><a href="how_it_works.html#deliveryoptions">Delivery Options</a></li>
                           <!-- <li><a href="weight_loss_kit.html">Weight Loss Kit - $399</a></li>
                            <li><a href="vitamins_for_life.html">Vitamins for life - $399</a></li>
                            <li><a href="diaetic_kit.html">Diabetic Kit - $399</a></li>
                            <li><a href="smart_home_health_care_kit.html">Smart Home Health Care Kit - $399</a></li>
                            <li><a href="energy_saving_kit.html">Energy Saving Kit - $399</a></li>-->
                          </ul>
                        </div>
                      </div>
                    </li>
                  </ul>
                
                </li>
                <li><a href="FAQ.html">FAQ's</a></li>
              </ul>
            </div>
          </nav>

        </div>
      </div>
    </header>

  <main id="main">
    <div class="container">
      <img src="assets/img/career_banner.jpg" alt="" class="img-responsive"/>
      <div class="row">

        <aside class="col-sm-4 col-md-3">
          <div class="panel panel-default">
            <div class="panel-heading"><h3 class="panel-title">Menu</h3></div>
            <ul class="list-group">
              <li class="list-group-item"><a href="corporate_site.html">About Us</a></li>

              <li class="list-group-item sub"><a href="about_us.html">Company</a></li>
              <li class="list-group-item sub"><a href="diversity.html">Diversity</a></li>
              <li class="list-group-item sub"><a href="corporate_and_social_initiatives.html"> Corporate and Social Initiatives </a></li>

              <li class="list-group-item"><a href="careers.html" title="Careers">Careers</a></li>
              <li class="list-group-item"><a href="affiliates.html" title="Affiliates">Affiliates</a></li>
            </ul>
          </div>
        </aside>

        <article class="col-sm-8 col-md-9">
          <div class="well well-sm">
            <h1 class="page-title">Careers</h1>
             <div class="contactBox table-responsive">
        	<p style="color:#F00"><?php if(isset($_GET['msg'])){echo"Thank You...We Will Contact You Soon...";}?></p>
            
        	<form action="career_apply.php" method="post" enctype="multipart/form-data" name="userform">
              <input type="hidden" name="job_id" value="<?php echo $jid;?>"/>
              <table cellpadding="5" cellspacing="0" class="logtable table borderless">
                <tr>
                  <td>Name</td>
                  <td><input type="text" name="name" id="name" class="form-control" onFocus="clrname()"/>
                    <span class=" LV_validation_message LV_invalid" style="display:none" id="err1">Can't be empty!</span></td>
                </tr>
                <tr>
                  <td>Email Address</td>
                  <td><input type="text" name="email" id="email" class="form-control" onFocus="clremail()"/>
                    <span class=" LV_validation_message LV_invalid" style="display:none" id="err2a">Can't be empty!</span> <span class=" LV_validation_message LV_invalid" style="display:none" id="err2b">Valid Email!</span></td>
                </tr>
                <tr>
                  <td>Phone</td>
                  <td><input type="text" name="phone" id="phone" class="form-control" onFocus="clrphone()"/>
                    <span class=" LV_validation_message LV_invalid" style="display:none" id="err3">Can't be empty!</span></td>
                </tr>
                <tr>
                  <td>Resume</td>
                  <td><input type="file" name="resume" id="resume"  onFocus="clrresume()"/>
                    <span class=" LV_validation_message LV_invalid" style="display:none; margin-left:183px;" id="err4">Upload Resume!</span></td>
                </tr>
                <tr valign="top">
                  <td>Remarks</td>
                  <td><textarea name="remarks" cols="25" rows="5"></textarea></td>
                </tr>
                <tr valign="top">
                  <td>Captcha</td>
                  <td><input type="text" name="captcha" id="captcha" style="width:30%;" onFocus="clrcap()"/>
                    <span class=" LV_validation_message LV_invalid" style="display:none" id="err5a">Can't be empty!</span> <span class=" LV_validation_message LV_invalid" style="display:none" id="err5b">Wrong Captcha!</span>
                    <div id="cap1" style="" class="cap">
                      <?php $text = rand(10000,99999); 
               $_SESSION["vercode"] = $text; echo $_SESSION['vercode'];?>
                    </div></td>
                </tr>
                <input type="hidden" id="cp2" value="<?php echo $_SESSION['vercode'];?>" class="input" name="cap2"/>
                <tr>
                  <td>&nbsp;</td>
                  <td><input type="submit" value="Submit" name="apply" onClick="return validate();"/></td>
                </tr>
              </table>
        	</form>
        </div>
          </div>

        </article>


      </div>

    </div>
  </main>

  <footer id="footer">
    <div class="container">
      <div class="row">

        <aside class="col-sm-8">

          <ul class="list-inline links">
            <li><a href="about_us.html">About Us</a></li>
            <li><a href="affiliates.html">Affiliates</a></li>
            <li><a href="partners.html">Partners</a></li>
            <li><a href="careers.html">Careers</a></li>
            <li><a href="contact_us.html">Contact Us</a></li>
            <li><a href="sitemap.html">Site Map</a></li>
            <li><a href="FAQ.html">FAQ's</a></li>
          </ul>
        </aside>
        <aside class="col-sm-4">
          <ul class="list-inline social-icons">
            <li><a href="https://www.facebook.com/pages/Wheel-Healthcare-Inc/537220013044604?fref=ts" target="_BLANK" class="fb"><i class="fa fa-facebook"></i></a></li>
            <li><a href="https://twitter.com/wheelhealthcare" target="_BLANK" class="tw"><i class="fa fa-twitter"></i></a></li>
            <li><a href="https://plus.google.com" target="_BLANK" class="gplus"><i class="fa fa-google-plus"></i></a></li>
            <li><a href="https://www.linkedin.com/" target="_BLANK" class="in"><i class="fa fa-linkedin"></i></a></li>

            <li><a href="http://www.youtube.com/" target="_BLANK" class="utube"><i class="fa fa-youtube"></i></a></li>
            <li><a href="http://www.flickr.com/" target="_BLANK" class="flckr"><i class="fa fa-flickr"></i></a></li>
          </ul>
        </aside>
      </div>
    </div>

    
    <div id="loginModel" class="reveal-modal">
    <div id="alert"></div>
	<form class="form-horizontal" name="request1" id="request" method="post" action="contact_mail.php" enctype="text/plain">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" name="name" placeholder="Name">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Phone No.</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone No.">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="email" name="email"  placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Message</label>
    <div class="col-sm-10">
      <textarea name="message" id="message" class="form-control" rows="3" placeholder="Message"></textarea>
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input type="submit" class="btn btn-default" value="Submit" name="contact">
    </div>
  </div>
</form>
<style>
.invalid{

	border:1px solid red;
}
</style>
<script>
$(document).ready(function() {

$("#request").validate({
             rules:
          {
            name:

            {

              required: true
            },
            phone:

            {

              required: true
            },

            email:
            {

              required: true,
              email:true,
            },
            message:

            {

              required: true
            }
  },

errorPlacement: function(error,element) {

            element.attr('placeholder',error.text());

        },

		 submitHandler: function()

          {

           // $("#Addloader").show();

         

             dataString = $('#request').serialize();        

                

             $.ajax({



                type: "POST",

                url: "contact_mail.php",              

                data: dataString,                               

                success: function(msd)

                {  

			//alert(msd);
				// $("#Addloader").hide();

				if(msd==1){
					$('#alert').html('<div class="success">Message Sent Successfully</div>');

                    $("#alert").fadeIn();
				}

				else{

					$('#alert').html('<div class="error">Message Delivery failed</div>');

                    $("#alert").fadeIn();
				}

					setTimeout(function(){
    $('.close-reveal-modal').click();
     location.reload(true);
}, 1000);

				}



             })

            

          }

});



});
</script>

</div>
  </footer>

  <footer id="footer-bottom">
    <div class="container">
      <p>&copy; 2014 Wheel HealthCare Services, Inc. All rights reserved. <a href="privacy.html">Privacy </a> &middot; <a href="terms.html">Terms of Use</a></p>
    </div>
  </footer>

  <a href="#none" class="scrollup">Scroll</a>
</body>
</html>