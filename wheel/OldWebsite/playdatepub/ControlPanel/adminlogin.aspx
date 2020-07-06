<%@ page language="C#" autoeventwireup="true" inherits="ControlPanel_adminlogin, App_Web_k0hvuyps" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- start: Meta -->
    <meta charset="utf-8">
    <title>Play Date Admin Panel</title>
    <meta name="description" content="Play Date Admin Panel">
    <meta name="author" content="Linez Technologies">
    <meta name="keyword" content="Play Date, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <!-- end: Meta -->
    <!-- start: Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- end: Mobile Specific -->
    <!-- start: CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="css/style.min.css" rel="stylesheet" />
    <link href="css/style-responsive.min.css" rel="stylesheet" />
    <link href="css/retina.css" rel="stylesheet" />
    <link href="css/validationEngine.css" rel="stylesheet" type="text/css" />
    <!-- end: CSS -->
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link href="css/ie.css" rel="stylesheet">
	<![endif]-->
    <!--[if IE 9]>
		<link id="ie9style" href="css/ie9.css" rel="stylesheet">
	<![endif]-->
    <!-- start: Favicon and Touch Icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
    <link rel="shortcut icon" href="ico/favicon.png" />
    <!-- end: Favicon and Touch Icons -->
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid-full">
        <div class="row-fluid">
            <div class="row-fluid">
                <div class="login-box">
                    <h2>
                        Login to your account</h2>
                    <div class="form-horizontal">
                        <asp:HiddenField ID="hfUserID" runat="server" ClientIDMode="Static" />
                        <fieldset>
                            <input class="validate[required] input-large span12" name="username"  onkeydown="setFocus(event)" id="txtusername" type="text" placeholder="type username" />
                            <input class="validate[required] input-large span12" name="password"  onkeydown="setFocus(event)" id="txtpassword" type="password" placeholder="type password" />
                            <div class="clearfix">
                            </div>
                            <%-- <label class="remember" for="remember">
                               <input type="checkbox" id="remember" />Remember me</label>--%>
                            <div class="clearfix">
                            </div>
                            <button type="button" class="btn btn-primary span12" id="btnLogin">
                                Login</button>
                                <asp:Button ID="LinkButton1" ClientIDMode="Static" runat="server" Text="Button" style="display:none" OnClick="LinkButton1_Click" />
                            <%--<asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton>--%>
                        </fieldset>
                    </div>
                   <%-- <hr/>
                    <h3>
                        Forgot Password?</h3>
                    <p>
                        No problem, <a href="#">click here</a> to get a new password.
                    </p>--%>
                </div>
            </div>
            <!--/row-->
        </div>
        <!--/fluid-row-->
    </div>
    <!--/.fluid-container-->
    <!-- start: JavaScript-->
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.ui.touch-punch.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src='js/fullcalendar.min.js'></script>
    <script src='js/jquery.dataTables.min.js'></script>
    <script src="js/excanvas.js"></script>
    <script src="js/jquery.flot.js"></script>
    <script src="js/jquery.flot.pie.js"></script>
    <script src="js/jquery.flot.stack.js"></script>
    <script src="js/jquery.flot.resize.min.js"></script>
    <script src="js/jquery.flot.time.js"></script>
    <script src="js/jquery.chosen.min.js"></script>
    <script src="js/jquery.uniform.min.js"></script>
    <script src="js/jquery.cleditor.min.js"></script>
    <script src="js/jquery.noty.js"></script>
    <script src="js/jquery.elfinder.min.js"></script>
    <script src="js/jquery.raty.min.js"></script>
    <script src="js/jquery.iphone.toggle.js"></script>
    <script src="js/jquery.uploadify-3.1.min.js"></script>
    <script src="js/jquery.gritter.min.js"></script>
    <script src="js/jquery.imagesloaded.js"></script>
    <script src="js/jquery.masonry.min.js"></script>
    <script src="js/jquery.knob.modified.js"></script>
    <script src="js/jquery.sparkline.min.js"></script>
    <script src="js/counter.min.js"></script>
    <script src="js/raphael.2.1.0.min.js"></script>
    <script src="js/justgage.1.0.1.min.js"></script>
    <script src="js/jquery.autosize.min.js"></script>
    <script src="js/retina.js"></script>
    <script src="js/jquery.placeholder.min.js"></script>
    <script src="js/wizard.min.js"></script>
    <script src="js/core.min.js"></script>
    <script src="js/charts.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/jquery.validationEngine.js" type="text/javascript"></script>
    <script src="js/jquery.validationEngine-en.js" type="text/javascript"></script>
    <script type="text/javascript">
        function setFocus(e) {
            if (e.keyCode == 13) {
                $("#btnLogin").focus();
                $('#btnLogin').click();
            }
        }


        $(document).ready(function () {
            // binds form submission and fields to the validation engine           
            $("#txtusername").focus();
            $("#form1").validationEngine();


            $("#btnLogin").click(function () {

                if ($("#txtusername").val() == "") {
                    $("#form1").validationEngine("validate");
                    return;
                }

                if ($("#txtpassword").val() == "") {
                    $("#form1").validationEngine("validate");
                    return;
                }

                var param = new Object();
                param.sUsername = $("#txtusername").val();
                param.sPassword = $("#txtpassword").val();

                $.ajax({
                    type: "POST",
                    url: "adminlogin.aspx/fnLogin",
                    data: JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d.length > 0) {

                            if (msg.d.toString() == "0") {
                                alert("Authenticated Users Only!");

                                return;
                            }
                            if (msg.d.toString() == "-1") {
                                alert("Problem in Authentication! Please try again later...");
                                return;
                            }                           

                            $("#hfUserID").val(msg.d);

                            $('#LinkButton1').click();
                        }
                        else {

                        }
                    }
                });
            });
        });



    </script>
    <!-- end: JavaScript-->
    </form>
</body>
</html>
