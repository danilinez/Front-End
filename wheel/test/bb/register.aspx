<%@ page language="C#" autoeventwireup="true" inherits="register, App_Web_y3vzyn31" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <!-- Meta Tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <!--  <link rel="shortcut icon" type="image/ico" href="img/favicon.ico"/>-->
    <!-- Styles -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <!--  custom styles-->
    <link href="css/bootstrap-lightbox.min.css" rel="stylesheet" media="screen" />
    <link href="css/global.css" rel="stylesheet" media="screen" />
    <link href="css/style.css" rel="stylesheet" media="screen" />
    <!-- IE Styles -->
    <!--[if (gt IE 8) | (IEMobile)]><!-->
    <link rel="stylesheet" href="css/unsemantic-grid-responsive.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link href="css/datepicker.css" rel="stylesheet" type="text/css" />
    <!--<![endif]-->
    <!--[if (lt IE 9) & (!IEMobile)]>
  <link rel="stylesheet" href="css/unsemantic-grid-responsive-ie.css" />
  <![endif]-->
    <!--[if lte IE 8]>
  <script src="js/html5.js"></script>
  <![endif]-->
    <!--[if IE 7]>
  <link href="css/font-awesome-ie7.min.css" rel="stylesheet">
  <![endif]-->
    <script src="ControlPanel/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            $(document).ready(function () {
                var nowTemp = new Date();
                var now = new Date(nowTemp.getFullYear() - 18, nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

                $('.datepicker').datepicker({

                    onRender: function (date) {
                        return date.valueOf() > now.valueOf() ? 'disabled' : '';
                    }
                });
                $('.datepicker').datepicker('setValue', nowTemp.getMonth().toString() + '/' + nowTemp.getDate().toString() + '/' + (nowTemp.getFullYear() - 18).toString());
            });
        });
    </script>
</head>
<body>
    <div id="signin_form" class="display-none">
        <div class="form-inline margin0">
            <input type="text" class="input-small" placeholder="Email">
            <div class="space2">
            </div>
            <input type="password" class="input-small" placeholder="Password">
            <div class="space2">
            </div>
            <button type="submit" class="btn btn-success">
                Sign in</button>
        </div>
        <div class="space2">
        </div>
        <a href="#none" class="font-size-12">Forgot password?</a>
    </div>
    
    
      <!--My Header Rearange - Start-->
    <div class="main-header">

   <div class="top_menu_bg padding10-top padding10-bottom">
    <div class="grid-container">
     <!--<div class="grid-50">

    <ul class="list-inline list-style-none contact-info margin0 font-size-11 line-height-13">
       
       <li><i class="icon-envelope-alt"></i>&nbsp;<a href="mailto:info@wheelhc.com" title="info@wheelhc.com">info@wheelhc.com</a></li>
          <li><i class="icon-envelope-alt"></i>&nbsp;<a href="mailto:admin@wheelhc.com" title="admin@wheelhc.com">admin@wheelhc.com</a></li>
          <li><i class="icon-envelope-alt"></i>&nbsp;<a href="mailto:partner@wheelhc.com" title="info@wheelhc.com">partner@wheelhc.com</a></li>
      </ul>

     </div>--> 
     <div class="grid-35">
      <a href="index.html" title="Wheel HC"><img src="img/logowheel.png" alt="Wheel HC" class="margin5-top" title="Wheel HC" /></a>
     </div>
     
     <ul class="nav inline list-style-none pull-right margin0 font-size-11 line-height-13 top-links">
       <li><a href="login.html" title="Member Login"><i class="icon-user"></i> Member Login</a></li>
       <li>·</li>
       <li><a href="choose_rergistration.html" title="Choose Registeration Type"><i class="icon-group"></i> Register</a></li>
      </ul>
     
     <div class="header_bg padding5-top padding20-bottom">
    <div class="grid-container">
    
     <div class="grid-65 padding0">

      <div class="navbar border-radius-5 pull-right margin0" id="site-menu">
       <div class="navbar-inner padding0-left padding0-right border-none">
        <div class="container">
         <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      
      <!--
         <div class="nav-collapse collapse">
          <ul class="nav margin0-right font-size-12">
           <li><a href="index.html" class="first-link active" title="Home">Home</a></li>
           <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#none" title="Products &amp; Services">Products &amp; Services<b class="caret"></b> </a>
            <ul class="dropdown-menu border-radius-5 margin10-top">
             <div class="grid-33">
              <li class="nav-header">Products</li>
              <li><a href="prescription_and_non-prescription_medicine.html" title="Prescription &amp; Non-Prescription Medicine">Prescription &amp; Non-Prescription Medicine</a></li>
              <li><a href="90_day_prescription_drug_program.html" title="90 Day Prescription Drug Program">90 Day Prescription Drug Program</a></li>
              <li><a href="dme_and_supplies.html" title="Durable Medical Equipment (DME) and Supplies">Durable Medical Equipment (DME) and Supplies</a></li>
              <li><a href="compounding.html" title="Compounding">Compounding</a></li>
             </div>
             <div class="grid-33">
              <li class="nav-header">Services</li>
              <li><a href="integrated_healthcare_cloud_technologies.html" title="Integrated Healthcare Cloud Technologies">Integrated Healthcare Cloud Technologies</a></li>
              <li><a href="personalized_healthcare_for_all.html" title="Personalized Healthcare For All">Personalized Healthcare For All</a></li>
              <li><a href="diabetes_education.html" title="Diabetes Education">Diabetes Education</a></li>
              <li><a href="disease_management.html" title="Disease Management">Disease Management</a></li>
              <li><a href="workers_compensation_pharmacy_solution.html" title="Workers compensation pharmacy solution">Workers Compensation Pharmacy solution</a></li>
             </div>
             <div class="grid-33">
              <li class="nav-header"><a href="promotional_products.html" title="Promotional Products">Promotional Products</a></li>

              <li><a href="vitamins_for_life.html" title="Vitamins for life">Vitamins for life - $399</a></li>
              <li><a href="energy_saving_kit.html" title="Energy Saving Kit"> Energy Saving Kit - $399</a></li>
              <li><a href="smart_home_health_care_kit.html" title=" Smart Home Health Care Kit"> Smart Home Health Care Kit - $399</a></li>
              <li><a href="weight_loss_kit.html" title=" Weight Loss Kit"> Weight Loss Kit - $399</a></li>
              <li><a href="diaetic_kit.html" title=" Diabetic Kit"> Diabetic Kit - $399</a></li>
             </div>

            </ul>
           </li>
           <li><a href="how_it_works.html" title="How It Works">How It Works</a></li>

           <li class="active"><a href="login.html" class="last-link" title="Sign In" id="signin">My Account</a></li>
          </ul>
         </div> -->
         <div class="nav-collapse collapse">
                                    <ul class="nav margin0-right font-size-12">
                                        <li><a href="index.html" class="first-link active" title="Home">Home</a></li>
                                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#none"
                                            title="Products &amp; Services">Products &amp; Services<b class="caret"></b> </a>
                                            <ul class="dropdown-menu border-radius-5 margin10-top">
                                                <div class="grid-33">
                                                    <li class="nav-header">Products</li>
                                                    <li><a href="prescription_and_non-prescription_medicine.html" title="Prescription &amp; Non-Prescription Medicine">
                                                        Prescription &amp; Non-Prescription Medicine</a></li>
                                                    <li><a href="90_day_prescription_drug_program.html" title="90 Day Prescription Drug Program">
                                                        90 Day Prescription Drug Program</a></li>
                                                    <li><a href="dme_and_supplies.html" title="Durable Medical Equipment (DME) and Supplies">
                                                        Durable Medical Equipment (DME) and Supplies</a></li>
                                                    <li><a href="compounding.html" title="Compounding">Compounding</a></li>
                                                </div>
                                                <div class="grid-33">
                                                    <li class="nav-header">Services</li>
                                                    <li><a href="integrated_healthcare_cloud_technologies.html" title="Integrated Healthcare Cloud Technologies">
                                                        Integrated Healthcare Cloud Technologies</a></li>
                                                    <li><a href="personalized_healthcare_for_all.html" title="Personalized Healthcare For All">
                                                        Personalized Healthcare For All</a></li>
                                                    <li><a href="diabetes_education.html" title="Diabetes Education">Diabetes Education</a></li>
                                                    <li><a href="disease_management.html" title="Disease Management">Disease Management</a></li>
                                                    <li><a href="workers_compensation_pharmacy_solution.html" title="Workers compensation pharmacy solution">
                                                        Workers Compensation Pharmacy solution</a></li>
                                                </div>
                                                <div class="grid-33">
                                                    <li class="nav-header"><a href="promotional_products.html" title="Promotional Products">
                                                        Promotional Products</a></li>
                                                    
                                                    
<li><a href="weight_loss_kit.html" title=" Weight Loss Kit">Weight Loss Kit - $399</a></li>

<li><a href="vitamins_for_life.html" title="Vitamins for life">Vitamins for life - $399</a></li>
<li><a href="diaetic_kit.html" title=" Diabetic Kit">Diabetic Kit - $399</a></li>                                                    <li><a href="smart_home_health_care_kit.html" title=" Smart Home Health Care Kit">Smart
                                                        Home Health Care Kit - $399</a></li>
                                                    
                                                    
<li><a href="energy_saving_kit.html" title="Energy Saving Kit">Energy Saving Kit - $399</a></li>                                                </div>
                                            </ul>
                                        </li>
                                        <li><a href="how_it_works.html" title="How It Works">How It Works</a></li>
                                        <li class="active"><a href="login.html" class="last-link" title="Sign In" id="signin">
                                            My Account</a></li>
                                    </ul>
                                </div>
        </div>
       </div>
      </div>

     </div>
    </div>
   </div>
     <div class="grid-50">

      <!--<ul class="nav inline list-style-none pull-right margin0 font-size-11 line-height-13 top-links">
       <li><a href="login.html" title="Member Login"><i class="icon-user"></i> Member Login</a></li>
       <li>·</li>
       <li><a href="choose_rergistration.html" title="Choose Registeration Type"><i class="icon-group"></i> Register</a></li>
      </ul>-->

     </div>
    </div>
   </div>

   
  </div>
 	<!--My Header Rearange - End--> 
    <!--
    <div class="main-header">
        <div class="top_menu_bg padding10-top padding10-bottom">
            <div class="grid-container">
                 
                <div class="grid-50">
                   <ul class="list-inline list-style-none contact-info margin0 font-size-11 line-height-13">
                        <li><i class="icon-envelope-alt"></i>&nbsp;<a href="mailto:info@wheelhc.com" title="info@wheelhc.com">info@wheelhc.com</a></li>
                        <li><i class="icon-envelope-alt"></i>&nbsp;<a href="mailto:admin@wheelhc.com" title="admin@wheelhc.com">admin@wheelhc.com</a></li>
                        <li><i class="icon-envelope-alt"></i>&nbsp;<a href="mailto:partner@wheelhc.com" title="info@wheelhc.com">partner@wheelhc.com</a></li>
                    </ul> 
                </div>
                
                <div class="grid-50">
                    <ul class="nav inline list-style-none pull-right margin0 font-size-11 line-height-13 top-links">
                        <li><a href="login.html" title="Member Login"><i class="icon-user"></i>Member Login</a></li>
                        <li>·</li>
                        <li><a href="choose_rergistration.html" title="Choose Registeration Type"><i class="icon-group">
                        </i>Register</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="header_bg padding5-top padding20-bottom">
            <div class="grid-container">
                <div class="grid-35">
                    <a href="index.html" title="Wheel HC">
                        <img src="img/logowheel.png" alt="Wheel HC" class="margin5-top" title="Wheel HC" /></a>
                </div>
                <div class="grid-65 padding0">
                    <div class="navbar border-radius-5 pull-right margin0" id="site-menu">
                        <div class="navbar-inner padding0-left padding0-right border-none">
                            <div class="container">
                                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                                    </span>
                                </button>
                                <div class="nav-collapse collapse">
                                    <ul class="nav margin0-right font-size-12">
                                        <li><a href="index.html" class="first-link active" title="Home">Home</a></li>
                                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#none"
                                            title="Products &amp; Services">Products &amp; Services<b class="caret"></b> </a>
                                            <ul class="dropdown-menu border-radius-5 margin10-top">
                                                <div class="grid-33">
                                                    <li class="nav-header">Products</li>
                                                    <li><a href="prescription_and_non-prescription_medicine.html" title="Prescription &amp; Non-Prescription Medicine">
                                                        Prescription &amp; Non-Prescription Medicine</a></li>
                                                    <li><a href="90_day_prescription_drug_program.html" title="90 Day Prescription Drug Program">
                                                        90 Day Prescription Drug Program</a></li>
                                                    <li><a href="dme_and_supplies.html" title="Durable Medical Equipment (DME) and Supplies">
                                                        Durable Medical Equipment (DME) and Supplies</a></li>
                                                    <li><a href="compounding.html" title="Compounding">Compounding</a></li>
                                                </div>
                                                <div class="grid-33">
                                                    <li class="nav-header">Services</li>
                                                    <li><a href="integrated_healthcare_cloud_technologies.html" title="Integrated Healthcare Cloud Technologies">
                                                        Integrated Healthcare Cloud Technologies</a></li>
                                                    <li><a href="personalized_healthcare_for_all.html" title="Personalized Healthcare For All">
                                                        Personalized Healthcare For All</a></li>
                                                    <li><a href="diabetes_education.html" title="Diabetes Education">Diabetes Education</a></li>
                                                    <li><a href="disease_management.html" title="Disease Management">Disease Management</a></li>
                                                    <li><a href="workers_compensation_pharmacy_solution.html" title="Workers compensation pharmacy solution">
                                                        Workers Compensation Pharmacy solution</a></li>
                                                </div>
                                                <div class="grid-33">
                                                    <li class="nav-header"><a href="promotional_products.html" title="Promotional Products">
                                                        Promotional Products</a></li>
                                                    <li><a href="vitamins_for_life.html" title="Vitamins for life">Vitamins for life - $399</a></li>
                                                    <!--<li><a href="energy_saving_kit.html" title="Energy Saving Kit">Energy Saving Kit - $399</a></li>
                                                    <li><a href="smart_home_health_care_kit.html" title=" Smart Home Health Care Kit">Smart
                                                        Home Health Care Kit - $399</a></li>
                                                    <li><a href="weight_loss_kit.html" title=" Weight Loss Kit">Weight Loss Kit - $399</a></li>
                                                    <li><a href="diaetic_kit.html" title=" Diabetic Kit">Diabetic Kit - $399</a></li>
                                                </div>
                                            </ul>
                                        </li>
                                        <li><a href="how_it_works.html" title="How It Works">How It Works</a></li>
                                        <li class="active"><a href="login.html" class="last-link" title="Sign In" id="signin">
                                            My Account</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    -->
    <div class="bg-white">
        <div class="grid-container">
            <div class="space10">
            </div>
            <div class="space10">
            </div>
            <div class="grid-75">
                <div class="thumbnail">
                    <div class="caption">
                        <form class="form-horizontal" runat="server">
                        <fieldset>
                            <!-- Form Name -->
                            <legend>Register as
                                <asp:Label ID="lblNameType" runat="server"></asp:Label></legend>
                            <!-- Text input-->
                            <div class="alert alert-success fade in" style="display: none">
                                <button type="button" class="close" data-dismiss="alert">
                                    ×</button>
                                <strong>Success:</strong>
                            </div>
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <div class="control-group">
                                <label class="control-label" for="name">
                                    First Name</label>
                                <div class="controls">
                                    <input id="txtname" name="name" pattern=".{1,50}" title="50 characters maximum" type="text"
                                        placeholder="" runat="server" class="input-xlarge" required />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="name">
                                    Last Name</label>
                                <div class="controls">
                                    <input id="txtLastName" name="name" pattern=".{1,50}" title="50 characters maximum"
                                        type="text" placeholder="" runat="server" class="input-xlarge" required />
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="email">
                                    Email</label>
                                <div class="controls">
                                    <input id="txtemail" name="email" type="text" placeholder="info@wheelhc.com" runat="server"
                                        class="input-xlarge" required />
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <asp:Label ID="lblExist" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtDOB">
                                    Date of Birth</label>
                                <div class="controls">
                                    <input id="txtDOB" clientidmode="Static" type="text" placeholder="MM/DD/YYYY" runat="server"
                                        class="input-xlarge datepicker" required value="" readonly />
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="txtpassword">
                                    Password</label>
                                <div class="controls">
                                    <input id="txtpassword" name="password" pattern=".{8,}" title="8 characters minimum"
                                        runat="server" type="password" placeholder="******" class="input-xlarge" required />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtConfirmPass">
                                    Confirm Password</label>
                                <div class="controls">
                                    <input id="txtConfirmPass" name="password" pattern=".{8,}" title="8 characters minimum"
                                        runat="server" type="password" placeholder="******" class="input-xlarge" required />
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="* Password should be same"
                                        ControlToCompare="txtpassword" ControlToValidate="txtConfirmPass" ValidationGroup="validEntry"
                                        ForeColor="Red"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="name">
                                    PostCode</label>
                                <div class="controls">
                                    <input id="txtPostCode" name="name" type="text" placeholder="" runat="server" class="input-xlarge"
                                        required="" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="name">
                                    Phone</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPhone" placeholder="e.g. (111)-111-1234" required="" runat="server"
                                        CssClass="input-xlarge"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Phone Format e.g. (111)111-1234"
                                        ValidationGroup="validEntry" ForeColor="Red" ControlToValidate="txtPhone" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="name">
                                    Address</label>
                                <div class="controls">
                                    <input id="txtAddress" name="name" type="text" placeholder="" runat="server" class="input-xlarge" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="name">
                                    Country</label>
                                <div class="controls">
                                    <input id="txtCountry" name="name" type="text" placeholder="" runat="server" class="input-xlarge" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="gender">
                                    Gender</label>
                                <div class="controls">
                                    <label class="radio inline" for="gender-0">
                                        <input type="radio" name="gender" id="ChkMale" value="Male" runat="server" checked />
                                        Male
                                    </label>
                                    <label class="radio inline" for="gender-1">
                                        <input type="radio" name="gender" id="ChkFemale" runat="server" value="Female" />
                                        Female
                                    </label>
                                </div>
                            </div>
                            <!-- Multiple Radios (inline)
         <div class="control-group">
          <label class="control-label" for="gender">Gender</label>
          <div class="controls">
           <label class="radio inline" for="gender-0">
            <input type="radio" name="gender" id="gender-0" value="Male" checked="checked">
            Male
           </label>
           <label class="radio inline" for="gender-1">
            <input type="radio" name="gender" id="gender-1" value="Female">
            Female
           </label>
          </div>
         </div> -->
                            <!-- Select Basic
         <div class="control-group">
          <label class="control-label" for="selectbasic">Select Basic</label>
          <div class="controls">
           <select id="selectbasic" name="selectbasic" class="input-xlarge">
            <option>Option one</option>
            <option>Option two</option>
           </select>
          </div>
         </div> -->
                            <!-- Textarea 
         <div class="control-group">
          <label class="control-label" for="textarea">Text Area</label>
          <div class="controls">
           <textarea id="textarea" name="textarea"></textarea>
          </div>
         </div>-->
                            <!-- Multiple Checkboxes -->
                            <div class="control-group">
                                <label class="control-label" for="checkboxes">
                                    Terms &amp; Condition <a href="terms.html" class="text-decoration-none" target="_BLANK">
                                        <i class="icon-external-link font-size-13"></i></a>
                                </label>
                                <div class="controls">
                                    <label class="checkbox" for="checkboxes-0">
                                        <input type="checkbox" name="checkboxes" runat="server" id="chkRememberMe" value="I Agree"
                                            required="" />
                                        I Agree
                                    </label>
                                </div>
                            </div>
                            <!-- Button (Double) -->
                            <div class="control-group">
                                <label class="control-label" for="button1id">
                                </label>
                                <div class="controls">
                                    <asp:Button ID="btnRegister" runat="server" class="btn btn-success" Text="Register"
                                        OnClick="btnRegister_Click" ValidationGroup="validEntry" CausesValidation="true" /><asp:Label
                                            ID="lblAgreeTerms" ForeColor="Maroon" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <div class="grid-25">
                <div class="thumbnail">
                    <img src="images/handwriting_from_screen.jpg" />
                    <%--<img src="http://www.wellhallmedicalcentre.co.uk/website/HAM001/files/handwriting_from_screen.jpg" />--%>
                </div>
            </div>
        </div>
    </div>
    <div class="space10">
    </div>
    <div class="footer_bg">
        <div class="grid-container">
            <!-- footer links start-->
            <div class="grid-60">
                <div>
                    <ul class="inline">
                        <li class="padding5-left"><a href="about_us.html">About Us</a></li>
                        <li class="padding5-left"><a href="affiliates.html">Affiliates</a></li>
                        <li class="padding5-left"><a href="partners.html">Partners</a></li>
                        <li class="padding5-left"><a href="careers.html">Careers</a></li>
                        <li class="padding5-left"><a href="privacy.html">Privacy</a></li>
                        <li class="padding5-left"><a href="terms.html">Terms of Use</a></li>
<li class="padding5-left"><a href="sitemap.html">Site Map</a></li>
                    </ul>
                </div>
            </div>
                    <!--My Logos of Social Media- Start-->
     			<div class="grid-40">
     <ul class="inline pull-right font-size-20">
      <strong><em><font size="+1" color="Black">Follow Us : </font></em></strong><li>
      
      <a href="#none" class="text-decoration-none"><i class="icon-facebook-sign"></i></a></li>
            <li><a href="#none" class="text-decoration-none"><i class="icon-google-plus-sign"></i></a></li>
      <li><a href="#none" class="text-decoration-none"><i class="icon-twitter-sign"></i></a></li>
      <li><a href="#none" class="text-decoration-none"><i class="icon-youtube-sign"></i></a></li>
     </ul>
    </div>
        <!--My Logos of Social Media- End-->
            <!--footer links end-->
        </div>
    </div>
    <div class="footer_bottom_bg">
        <div class="grid-container">
            <!-- bottom footer start-->
            <footer class="grid-100">
     <!-- bottom footer links-->
     
     <!--bottom footer links end-->
     <!--copyright text start-->
     <p class="muted">© 2014 Wheel Health Care Services Inc. All rights reserved.</p>
     <!-- copyright text end-->
     <div class="clearfix"></div>
    </footer>
            <!-- bottom footer end-->
        </div>
    </div>
    <!-- Scripts -->
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src='js/jquery.html5-placeholder-shim.js'></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-lightbox.min.js"></script>
    <script src="js/functions.js"></script>
</body>
</html>
