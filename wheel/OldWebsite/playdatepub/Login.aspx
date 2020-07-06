<%@ page language="C#" autoeventwireup="true" inherits="Login, App_Web_rikqikx0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- start: Meta -->
    <meta charset="utf-8">
    <title>Login | Play Date</title>
    <meta name="description" content="Play Date Admin Panel">
    <meta name="author" content="Linez Technologies">
    <meta name="keyword" content="Play Date, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <!-- end: Meta -->
    <!-- start: Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- end: Mobile Specific -->
    <!-- start: CSS -->
    <link href="<%: Page.ResolveUrl("~/assets/css/bootstrap.min.css") %>" rel="stylesheet" />
    <link href="<%: Page.ResolveUrl("~/assets/css/bootstrap-responsive.min.css") %>"
        rel="stylesheet" />
    <link href="<%: Page.ResolveUrl("~/assets/css/style.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%: Page.ResolveUrl("~/assets/css/style-responsive.min.css") %>" rel="stylesheet" />
    <link href="<%: Page.ResolveUrl("~/assets/css/validationEngine.css") %>" rel="stylesheet"
        type="text/css" />
    <link href="<%: Page.ResolveUrl("~/assets/css/datepicker.css") %>" rel="stylesheet"
        type="text/css" />
    <link href="<%: Page.ResolveUrl("~/assets/css/DT_bootstrap.css") %>" rel="stylesheet"
        type="text/css" />
    <link href="<%: Page.ResolveUrl("~/assets/css/bootstrap-datetimepicker.min.css") %>"
        rel="stylesheet" type="text/css" />
    <link href="<%: Page.ResolveUrl("~/assets/css/tagmanager.css") %>" rel="stylesheet"
        type="text/css" />
    <link href="<%: Page.ResolveUrl("~/assets/css/retina.css") %>" rel="stylesheet" />
    <!-- end: CSS -->
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link href="<%: Page.ResolveUrl("~/assets/css/ie.css") %>" rel="stylesheet">
	<![endif]-->
    <!--[if IE 9]>
		<link href="<%: Page.ResolveUrl("~/assets/css/ie9.css") %>" rel="stylesheet">
	<![endif]-->
    <!-- start: Favicon and Touch Icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%: Page.ResolveUrl("~/assets/ico/apple-touch-icon-144-precomposed.png") %>" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%: Page.ResolveUrl("~/assets/ico/apple-touch-icon-114-precomposed.png") %>" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%: Page.ResolveUrl("~/assets/ico/apple-touch-icon-72-precomposed.png") %>" />
    <link rel="apple-touch-icon-precomposed" href="<%: Page.ResolveUrl("~/assets/ico/apple-touch-icon-57-precomposed.png") %>" />
    <link rel="shortcut icon" href="<%: Page.ResolveUrl("~/assets/ico/favicon.png") %>" />
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
                            <input class="validate[required] input-large span12" name="username" onkeydown="setFocus(event)"
                                id="txtusername" type="text" placeholder="type username" />
                            <input class="validate[required] input-large span12" name="password" onkeydown="setFocus(event)"
                                id="txtpassword" type="password" placeholder="type password" />
                            <div class="clearfix">
                            </div>
                            <button type="button" class="btn btn-primary span12" id="btnLogin">
                                Login</button>
                            <asp:Button ID="LinkButton1" ClientIDMode="Static" runat="server" Text="Button" Style="display: none"
                                OnClick="LinkButton1_Click" />
                            <%--<asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton>--%>
                            <br />
                            <a href="Register.aspx" style="text-align: center; display: block;" title="Register">
                                Register</a>
                            <div id="dvMessage">
                            </div>
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
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery-1.10.2.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery-migrate-1.2.1.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery-ui-1.10.3.custom.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.ui.touch-punch.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/modernizr.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/bootstrap.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.cookie.js") %>"></script>
    <script type="text/javascript" src='<%: Page.ResolveUrl("~/assets/js/fullcalendar.min.js") %>'></script>
    <script type="text/javascript" src='<%: Page.ResolveUrl("~/assets/js/jquery.dataTables.min.js") %>'></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/excanvas.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.flot.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.flot.pie.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.flot.stack.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.flot.resize.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.flot.time.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.chosen.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.uniform.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.cleditor.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.noty.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.elfinder.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.raty.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.iphone.toggle.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.uploadify-3.1.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.gritter.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.imagesloaded.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.masonry.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.knob.modified.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.sparkline.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/counter.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/raphael.2.1.0.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/justgage.1.0.1.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.autosize.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/retina.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.placeholder.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/wizard.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/core.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/charts.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/custom.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.validationEngine.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/jquery.validationEngine-en.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/bootstrap-datepicker.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/DT_bootstrap.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/ajaxfileupload.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/bootstrap-datetimepicker.min.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/assets/js/tagmanager.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/ckeditor/ckeditor.js") %>"></script>
    <script type="text/javascript" src="<%: Page.ResolveUrl("~/ckeditor/adapters/jquery.js") %>"></script>
    <!-- end: JavaScript-->
    <script type="text/javascript">
        function setFocus(e) {
            if (e.keyCode == 13) {
                $("#btnLogin").focus();
                $('#btnLogin').click();
            }
        }


        $(document).ready(function () {

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
                    url: "Login.aspx/fnLogin",
                    data: JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d.length > 0) {

                            if (msg.d.toString() == "0") {

                                $("#dvMessage").attr("class", "alert alert-error");
                                $("#dvMessage").text('Authenticated Users Only!');                                
                                return;
                            }

                            if (msg.d.toString() == "-1") {
                                $("#dvMessage").attr("class", "alert alert-error");
                                $("#dvMessage").text('Problem in Authentication! Please try again later...');  
                                return;
                            }

                            $("#hfUserID").val(msg.d);

                            $('#LinkButton1').click();
                        }
                    }
                });
            });
        });
    </script>
    </form>
</body>
</html>
