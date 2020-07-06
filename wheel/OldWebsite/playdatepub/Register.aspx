<%@ page language="C#" autoeventwireup="true" inherits="Register, App_Web_rikqikx0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- start: Meta -->
    <meta charset="utf-8">
    <title>Register | Play Date</title>
    <meta name="description" content="Play Date Admin Panel">
    <meta name="author" content="Linez Technologies">
    <meta name="keyword" content="Play Date, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <!-- end: Meta -->
    <!-- start: Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- end: Mobile Specific -->
    <!-- start: CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/style-responsive.min.css" rel="stylesheet" />
    <link href="assets/css/validationEngine.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/datepicker.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/DT_bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/tagmanager.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/retina.css" rel="stylesheet" />
    <!-- end: CSS -->
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link href="assets/css/ie.css" rel="stylesheet">
	<![endif]-->
    <!--[if IE 9]>
		<link href="assets/css/ie9.css" rel="stylesheet">
	<![endif]-->
    <!-- start: Favicon and Touch Icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png" />
    <link rel="shortcut icon" href="assets/ico/favicon.png" />
    <!-- end: Favicon and Touch Icons -->
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hfUserID" runat="server" ClientIDMode="Static" />
    <div class="container-fluid-full">
        <div class="row-fluid">
            <div class="row-fluid">
                <div class="register-box">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Register</legend>
                            <div class="control-group">
                                <label class="control-label" for="txtFN">
                                    First Name</label>
                                <div class="controls">
                                    <input type="text" id="txtFN" class="validate[required] input-xlarge" placeholder="First Name"
                                        data-prompt-position="topRight" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtLN">
                                    Last Name</label>
                                <div class="controls">
                                    <input type="text" id="txtLN" class="validate[required] input-xlarge" placeholder="Last Name" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtEmail">
                                    Email</label>
                                <div class="controls">
                                    <input type="text" id="txtEmail" class="validate[required,custom[email]] input-xlarge"
                                        placeholder="Email" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtUN">
                                    Username</label>
                                <div class="controls">
                                    <input type="text" id="txtUN" class="validate[required,custom[userName]] input-xlarge"
                                        placeholder="Username" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtPswd">
                                    Password</label>
                                <div class="controls">
                                    <input type="password" id="txtPswd" class="validate[required] input-xlarge" placeholder="Password" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtPhone">
                                    Phone</label>
                                <div class="controls">
                                    <input type="text" id="txtPhone" placeholder="Phone" class="input-xlarge" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtMobile">
                                    Mobile</label>
                                <div class="controls">
                                    <input type="text" id="txtMobile" placeholder="Mobile" class="input-xlarge" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtAddress">
                                    Address</label>
                                <div class="controls">
                                    <textarea rows="3" id="txtAddress" placeholder="Address" class="input-xlarge"></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtPostCode">
                                    Post Code</label>
                                <div class="controls">
                                    <input type="text" id="txtPostCode" placeholder="Post Code" class="input-xlarge" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="txtCity">
                                    City</label>
                                <div class="controls">
                                    <input type="text" id="txtCity" placeholder="City" class="input-xlarge" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="ddlState">
                                    State</label>
                                <div class="controls">
                                    <select id="ddlState" class="input-xlarge">
                                        <option value="Australian Capital Territory">Australian Capital Territory</option>
                                        <option value="New South Wales">New South Wales</option>
                                        <option value="Northern Territory">Northern Territory</option>
                                        <option value="Queensland">Queensland</option>
                                        <option value="South Australia">South Australia</option>
                                        <option value="Tasmania">Tasmania</option>
                                        <option value="Victoria">Victoria</option>
                                        <option value="Western Australia">Western Australia </option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="ddlCountry">
                                    Country</label>
                                <div class="controls">
                                    <select id="ddlCountry" class="input-xlarge">
                                        <option value="Australia">Australia</option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="fleProfilePic">
                                    Profile Picture</label>
                                <div class="controls">
                                    <asp:FileUpload ID="fleProfilePic" ClientIDMode="Static" CssClass="input-file uniform_on"
                                        runat="server" />
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="button" id="btnSaveUser" class="btn btn-success" onclick="fnSaveUser();">
                                    Sign Up</button>
                                <a href="Login.aspx" class="btn btn-default" title="Login">Login</a>
                                <asp:Button ID="LinkButton1" ClientIDMode="Static" OnClick="LinkButton1_Click" runat="server"
                                    Text="Button" Style="display: none" />
                            </div>
                        </fieldset>
                    </div>
                    <div id="dvMessage" runat="server" clientidmode="Static">
                    </div>
                    <hr />
                </div>
            </div>
            <!--/row-->
        </div>
        <!--/fluid-row-->
    </div>
    <!-- start: JavaScript-->
    <script type="text/javascript" src="assets/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.ui.touch-punch.js"></script>
    <script type="text/javascript" src="assets/js/modernizr.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
    <script type="text/javascript" src='assets/js/fullcalendar.min.js'></script>
    <script type="text/javascript" src='assets/js/jquery.dataTables.min.js'></script>
    <script type="text/javascript" src="assets/js/excanvas.js"></script>
    <script type="text/javascript" src="assets/js/jquery.flot.js"></script>
    <script type="text/javascript" src="assets/js/jquery.flot.pie.js"></script>
    <script type="text/javascript" src="assets/js/jquery.flot.stack.js"></script>
    <script type="text/javascript" src="assets/js/jquery.flot.resize.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.flot.time.js"></script>
    <script type="text/javascript" src="assets/js/jquery.chosen.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.cleditor.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.noty.js"></script>
    <script type="text/javascript" src="assets/js/jquery.elfinder.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.raty.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.iphone.toggle.js"></script>
    <script type="text/javascript" src="assets/js/jquery.uploadify-3.1.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.gritter.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.imagesloaded.js"></script>
    <script type="text/javascript" src="assets/js/jquery.masonry.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.knob.modified.js"></script>
    <script type="text/javascript" src="assets/js/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="assets/js/counter.min.js"></script>
    <script type="text/javascript" src="assets/js/raphael.2.1.0.min.js"></script>
    <script type="text/javascript" src="assets/js/justgage.1.0.1.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.autosize.min.js"></script>
    <script type="text/javascript" src="assets/js/retina.js"></script>
    <script type="text/javascript" src="assets/js/jquery.placeholder.min.js"></script>
    <script type="text/javascript" src="assets/js/wizard.min.js"></script>
    <script type="text/javascript" src="assets/js/core.min.js"></script>
    <script type="text/javascript" src="assets/js/charts.min.js"></script>
    <script type="text/javascript" src="assets/js/custom.js"></script>
    <script type="text/javascript" src="assets/js/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="assets/js/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/js/DT_bootstrap.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="assets/js/tagmanager.js"></script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="ckeditor/adapters/jquery.js"></script>
    <!-- end: JavaScript-->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validationEngine();
        });

        var sValidEmail = "0";
        var sValidUsername = "0";

        function fnValidateEmailTaken() {
            var param = new Object();
            param.sEmail = $("#txtEmail").val();

            return $.ajax({
                type: "POST",
                url: "Register.aspx/fnValidateEmailTaken",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {
                        sValidEmail = msg.d;
                    }
                }
            });
        }

        function fnValidateUserNameTaken() {
            var param = new Object();
            param.sUserName = $("#txtUN").val();

            return $.ajax({
                type: "POST",
                url: "Register.aspx/fnValidateUserNameTaken",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {
                        sValidUsername = msg.d;
                    }
                }
            });
        }

        function fnSaveUser() {
            if ($("#form1").validationEngine("validate")) {
                var objFLU = $('#fleProfilePic');
                $.when(fnValidateEmailTaken(), fnValidateUserNameTaken()).done(function () {

                    if (sValidEmail == '1') {
                        alert('Email already taken!');
                        return;
                    }

                    if (sValidUsername == '1') {
                        alert('Username already taken!');
                        return;
                    }

                    var objParam = new Object();

                    objParam.sFirstname = $("#txtFN").val();
                    objParam.sLastName = $("#txtLN").val();
                    objParam.sUserName = $("#txtUN").val();
                    objParam.sEmail = $("#txtEmail").val();
                    objParam.sPassword = $("#txtPswd").val();
                    objParam.sPhoneNumber = $("#txtPhone").val();
                    objParam.sMobileNumber = $("#txtMobile").val();
                    objParam.sAddress = $("#txtAddress").val();
                    objParam.sCity = $("#txtCity").val();
                    objParam.sState = $("#ddlState option:selected").val();
                    objParam.sCountry = $("#ddlCountry option:selected").val();

                    if ($('input[name="chkbActive"]:checked'))
                        objParam.sStatus = "1";
                    else
                        objParam.sStatus = "0";


                    objParam.sPostalCode = $("#txtPostCode").val();

                    $.ajax({
                        type: "POST",
                        url: "Register.aspx/fnSaveUser",
                        data: JSON.stringify(objParam),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            if (msg.d.length > 0) {
                                if (msg.d == "-1") {
                                    alert("Problem in Saving User");
                                    return;
                                }
                                else {
                                    $("#hfUserID").val(msg.d);
                                    $('#LinkButton1').click();
                                    $("#dvMessage").attr("class", 'alert alert-success');
                                    $("#dvMessage").text('Registered Successfully!');                                    
                                    $("#dvMessage").delay(2000);
                                }
                            }
                        }
                    });
                });
            }
            else {
                return;
            }
        }
    </script>
    </form>
</body>
</html>
