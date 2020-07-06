<%@ page language="C#" autoeventwireup="true" inherits="changepassword, App_Web_y3vzyn31" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
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
</head>
<body>
    <form id="form1" runat="server">
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
                                                    <!--<li><a href="energy_saving_kit.html" title="Energy Saving Kit">Energy Saving Kit - $399</a></li>-->
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
    <div class="bg-white">
        <div class="grid-container">
            <div class="space10">
            </div>
            <div class="space10">
            </div>
            <div class="grid-75">
                <div class="thumbnail">
                    <div class="caption">
                        <div class="form-horizontal" id="divForgotPassword">
                            <fieldset>
                                <legend>Change Password</legend>
                                <div class="control-group">
                                    <label class="control-label" for="email">
                                        New Password<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="cpValidate"
                                            ControlToValidate="txtNewPassword" runat="server" ErrorMessage=" *" ForeColor="Red"></asp:RequiredFieldValidator></label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                    </label>
                                    <div class="controls">
                                        <asp:RegularExpressionValidator ValidationExpression="^.{8,15}$" ID="MenuLabelVal"
                                            runat="server" ErrorMessage="Password should be minimum of 8 characters." ForeColor="Red"
                                            ControlToValidate="txtNewPassword" ValidationGroup="cpValidate" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="email">
                                        Confirm Password<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="cpValidate"
                                            ControlToValidate="txtNewPassword" runat="server" ForeColor="Red" ErrorMessage=" *"></asp:RequiredFieldValidator></label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                    </label>
                                    <div class="controls">
                                        <asp:CompareValidator ID="CompareValidator1" ValidationGroup="cpValidate" ControlToValidate="txtConfirmPassword"
                                            ControlToCompare="txtNewPassword" runat="server" ErrorMessage="Password mismatch"
                                            ForeColor="Red"></asp:CompareValidator>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="button1id">
                                    </label>
                                    <div class="controls">
                                        <asp:Button ID="btnChangePassword" ValidationGroup="cpValidate" CausesValidation="true"
                                            runat="server" CssClass="btn btn-info" Text="Save" OnClick="btnChangePassword_Click" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid-25">
                <div class="thumbnail">
                    <div class="caption">
                        <div class="text-center">
                            <h3>
                                Register Now</h3>
                            <ul class="list-style-none margin0">
                                <li><a class="btn btn-default btn-block" href="register.aspx?type=Doctor"><i class="icon-stethoscope">
                                </i>As a Doctor</a></li><br />
                                <%-- <li><a class="btn btn-default btn-block" href="register.aspx?type=Pharmacists"><i
                                    class="icon-medkit"></i>As a Pharmacist</a></li><br />--%>
                                <li><a class="btn btn-default btn-block" href="register.aspx?type=Patient"><i class="icon-user">
                                </i>As a Patient</a> </li>
                            </ul>
                        </div>
                    </div>
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
            <div class="grid-40">
                <ul class="inline pull-right font-size-20">
                    <li><a href="#none" class="text-decoration-none"><i class="icon-facebook-sign"></i></a>
                    </li>
                    <li><a href="#none" class="text-decoration-none"><i class="icon-twitter-sign"></i></a>
                    </li>
                    <li><a href="#none" class="text-decoration-none"><i class="icon-google-plus-sign"></i>
                    </a></li>
                    <li><a href="#none" class="text-decoration-none"><i class="icon-youtube-sign"></i></a>
                    </li>
                </ul>
            </div>
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
    </form>
</body>
</html>
