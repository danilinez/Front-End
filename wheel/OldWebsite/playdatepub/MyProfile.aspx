<%@ page title="" language="C#" masterpagefile="~/Client.master" autoeventwireup="true" inherits="MyProfile, App_Web_fq5tkfli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validationEngine();
            $('#txtDOB').datepicker();
            fnLoadUserDetails();
        });

        var sValidEmail = "0";
        var sValidUsername = "0";

        function fnLoadUserDetails() {
            var param = new Object();
            param.sUserID = '<%= Session["UserID"] %>';
            return $.ajax({
                type: "POST",
                url: "MyProfile.aspx/fnEditUser",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {

                        var obj = jQuery.parseJSON(msg.d);
                        $.each(obj, function (index, value) {

                            $("#hfUserID").val(value.iUserAccountID);
                            $("#lblState").text($("#ddlState option:selected").text());
                            $("#lblName").text(value.sFirstName + ' ' + value.sLastName);

                            $("#lblEmail").text(value.sEmail);
                            $("#lblPhone").text(value.sPhoneNumber);
                            $("#lblMobile").text(value.sMobileNumber);
                            $("#lblAddress").text(value.sAddress);
                            $("#lblCity").text(value.sCity);
                            $("#lblPostCode").text(value.sPostalCode);
                            $("#lblDOB").text(value.dtDOB1);
                            $("#lblUsername").text(value.sUserName);
                            $("#ddlState").val(value.sState);
                            $("#lblState").text($("#ddlState option:selected").text());
                            if (value.sProfilePicture == "") {
                                $("#imgProfilePic").attr("src", "ico/apple-touch-icon-144-precomposed.png");
                            }
                            
                            else {
                                $("#imgProfilePic").attr("src", "UploadFiles/" + value.sProfilePicture + "");
                            }

                            $("#lblCountry").text(value.sCountry);
                            
                            if (value.btIsActive) {
                                $('#lblStatus').text("Active Account");
                            }
                            
                            else {
                                $('#lblStatus').text("InActive Account");
                            }
                        });
                    }
                }
            });
        }

        function fnEditUser() {
            var param = new Object();
            param.sUserID = '<%= Session["UserID"] %>';
            return $.ajax({
                type: "POST",
                url: "MyProfile.aspx/fnEditUser",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {
                        var obj = jQuery.parseJSON(msg.d);
                        
                        $.each(obj, function (index, value) {
                            $("#hfUserID").val(value.iUserAccountID);
                            $("#txtFN").val(value.sFirstName);
                            $("#txtLN").val(value.sLastName);
                            $("#txtEmail").val(value.sEmail);
                            $("#txtPhone").val(value.sPhoneNumber);
                            $("#txtMobile").val(value.sMobileNumber);
                            $("#txtAddress").val(value.sAddress);
                            $("#txtCity").val(value.sCity);
                            $("#txtPostCode").val(value.sPostalCode);
                            $("#txtDOB1").val(value.dtDOB1);
                            $("#txtUN").val(value.sUserName);
                            $("#txtPswd").val(value.sPassword);
                            $("#ddlState").val(value.sState);
                            $("#ddlCountry").val(value.sCountry);                            
                        });
                        
                        $("#lblMode").text("Edit User");
                        $("#btnAddUser").click();
                    }
                }
            });
        }

        function fnValidateEmailTaken() {
            var param = new Object();
            param.sUserID = $("#hfUserID").val();
            param.sEmail = $("#txtEmail").val();

            return $.ajax({
                type: "POST",
                url: "MyProfile.aspx/fnValidateEmailTaken",
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
            param.sUserID = $("#hfUserID").val();
            param.sUserName = $("#txtUN").val();

            return $.ajax({
                type: "POST",
                url: "MyProfile.aspx/fnValidateUserNameTaken",
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

                    objParam.sUserID = $("#hfUserID").val();
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

                    objParam.sPostalCode = $("#txtPostCode").val();
                    objParam.sDOB = $("#txtDOB1").val();



                    $.ajax({
                        type: "POST",
                        url: "MyProfile.aspx/fnSaveUser",
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
                                    var imgVal = $('#fleProfilePic').val();

                                    if (imgVal != '') {
                                        $("#hfUserID").val(msg.d);
                                        $('#LinkButton1').click();
                                        fnLoadUserDetails();
                                    }
                                    else {
                                        fnLoadUserDetails();
                                        $("#btnClosePOPUP").click();
                                        $("#hfUserID").val('');
                                        fnResetForm();

                                    }

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

        function fnResetForm() {
            $("#txtFN").val('');
            $("#txtLN").val('');
            $("#txtEmail").val('');
            $("#txtDOB1").val('');
            $("#txtUN").val('');
            $("#txtPswd").val('');
            $("#txtMobile").val('');
            $("#txtAddress").val('');
            $("#txtPhone").val('');
            $("#txtDOB1").val('');
            $("#txtPostCode").val('');
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content" class="span10">
        <div class="row-fluid">
            <div class="box span12">
                <div class="box-header" data-original-title>
                    <h2>
                        <i class="icon-user"></i><span class="break"></span>My Profile</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-minimize"><i class="icon-chevron-up"></i></a><a href="#" onclick="fnEditUser()">
                            <i class="icon-edit"></i></a>
                    </div>
                </div>
                <div class="box-content">
                    <asp:Button ID="LinkButton1" ClientIDMode="Static" runat="server" Text="used" Style="display: none"
                        OnClick="LinkButton1_Click" />
                    <asp:HiddenField ID="hfUserID" runat="server" ClientIDMode="Static" />
                    <input type="hidden" id="hfUT" />
                    <dl class="dl-horizontal">
                        <dt>Name:</dt>
                        <dd>
                            <span id="lblName"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Username:</dt>
                        <dd>
                            <span id="lblUsername"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Email:</dt>
                        <dd>
                            <span id="lblEmail"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Date of Birth:</dt>
                        <dd>
                            <span id="lblDOB"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Phone:</dt>
                        <dd>
                            <span id="lblPhone"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Mobile:</dt>
                        <dd>
                            <span id="lblMobile"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Address:</dt>
                        <dd>
                            <span id="lblAddress"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Post Code:</dt>
                        <dd>
                            <span id="lblPostCode"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>City:</dt>
                        <dd>
                            <span id="lblCity"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>State:</dt>
                        <dd>
                            <span id="lblState"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Country:</dt>
                        <dd>
                            <span id="lblCountry"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Account Created On:</dt>
                        <dd>
                            <span id="lblCreatedOn"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Status:</dt>
                        <dd>
                            <span id="lblStatus"></span>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>Profile Pic:</dt>
                        <dd>
                            <img id="imgProfilePic" alt="Profile Pic" src="assets/ico/apple-touch-icon-144-precomposed.png"
                                width="60px" height="70px" />
                        </dd>
                    </dl>
                </div>
            </div>
            <!--/span-->
        </div>
        <!--/row-->
    </div>
    <!-- end: Content -->
    <button type="button" data-toggle="modal" id="btnAddUser" data-target="#mdlUsers"
        data-backdrop="static" data-keyboard="false" style="display: none;">
        Add User</button>
    <div class="modal hide fade" id="mdlUsers">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
                ×</button>
            <h3>
                <span id="lblMode">Add New User</span></h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="txtFN">
                            First Name</label>
                        <div class="controls">
                            <input type="text" id="txtFN" class="validate[required]" placeholder="First Name"
                                data-prompt-position="bottomRight">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtLN">
                            Last Name</label>
                        <div class="controls">
                            <input type="text" id="txtLN" class="validate[required]" placeholder="Last Name">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtEmail">
                            Email</label>
                        <div class="controls">
                            <input type="text" id="txtEmail" class="validate[required,custom[email]]" placeholder="Email">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtDOB1">
                            Date of Birth</label>
                        <div class="controls">
                            <div class="input-append date" id="txtDOB" data-date="" data-date-format="dd/mm/yyyy">
                                <input size="16" type="text" id="txtDOB1" value="" class="validate[required,custome[dateFormat]]"
                                    readonly="readonly">
                                <span class="add-on"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtUN">
                            Username</label>
                        <div class="controls">
                            <input type="text" id="txtUN" class="validate[required,custom[userName]]" placeholder="Username">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtPswd">
                            Password</label>
                        <div class="controls">
                            <input type="password" id="txtPswd" class="validate[required]" placeholder="Password">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtPhone">
                            Phone</label>
                        <div class="controls">
                            <input type="text" id="txtPhone" placeholder="Phone">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtMobile">
                            Mobile</label>
                        <div class="controls">
                            <input type="text" id="txtMobile" placeholder="Mobile">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtAddress">
                            Address</label>
                        <div class="controls">
                            <textarea rows="3" id="txtAddress" placeholder="Address"></textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtPostCode">
                            Post Code</label>
                        <div class="controls">
                            <input type="text" id="txtPostCode" placeholder="Post Code">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="txtCity">
                            City</label>
                        <div class="controls">
                            <input type="text" id="txtCity" placeholder="City">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="ddlState">
                            State</label>
                        <div class="controls">
                            <select id="ddlState">
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
                            <select id="ddlCountry">
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
                </fieldset>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal" onclick='fnResetForm();' id="btnClosePOPUP">
                Close</a> <a href="#" class="btn btn-primary" onclick="fnSaveUser();">Save</a>
        </div>
    </div>
</asp:Content>

