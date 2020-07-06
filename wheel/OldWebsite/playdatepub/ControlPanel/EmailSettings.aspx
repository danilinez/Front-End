<%@ page title="" language="C#" masterpagefile="~/ControlPanel/Admin.master" autoeventwireup="true" inherits="ControlPanel_EmailSettings, App_Web_jx024tsd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validationEngine();
            fnLoadEmailAccount();
        });

        function fnSaveSettings() {
            if ($("#form1").validationEngine('validate')) {
                var objParam = new Object();
                //                txtEmail txtUsername txtSMTP txtPassword chkbSSL
                objParam.sEmailID = $("#hfEmailID").val();
                objParam.sEmail = $("#txtEmail").val();
                objParam.sUsername = $("#txtUsername").val();
                objParam.sSMTP = $("#txtSMTP").val();
                objParam.sPassword = $("#txtPassword").val();
                objParam.sPort = $("#txtPort").val();

                if ($('input[name="chkbSSL"]:checked'))
                    objParam.sSSL = "1";
                else
                    objParam.sSSL = "0";

                objParam.sUserID = ''+<%= Session["objUID"] %>+'';

                return $.ajax({
                    type: "POST",
                    cache: false,
                    url: "EmailSettings.aspx/fnSaveSettings",
                    data: JSON.stringify(objParam),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d.length > 0) {
                            if (msg.d == "1")
                                alert("Account Saved");
                            else
                                alert("Problem in saving");
                        }
                    }
                });
            }
        }

        function fnLoadEmailAccount() {   
         
                return $.ajax({
                type: "POST",
                cache: false,
                url: "EmailSettings.aspx/fnLoadEmailAccount",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {
                        var obj = jQuery.parseJSON(msg.d);

                        $.each(obj,function(index,value){ 

                        $("#hfEmailID").val(value.iEmailAccountID);           
                        $("#txtEmail").val(value.sEmailAddress);
                        $("#txtUsername").val(value.sUsername);
                        $("#txtSMTP").val(value.sSMTP);
                        $("#txtPassword").val(value.sPassword);
                        $("#txtPort").val(value.sPort);  
                        
                        if(value.btUseSSL)
                        {
                        $('#chkbSSL').prop('checked',value.btUseSSL);
                        }
                        else
                        {

                        $('#chkbSSL').prop('checked',value.btUseSSL);
                        }
                        
                        
                         
                        });
                    }
                    else
                    {
                       fnReserForm();
                    }
                }
            });
        }

       function fnReserForm()
        {        
        $("#txtEmail").val('');
        $("#txtUsername").val('');
        $("#txtSMTP").val('');
        $("#txtPassword").val('');
        $("#txtPort").val('');  
        $('#chkbSSL').prop('checked',false);       
       }
    </script>
    <!-- start: Header -->
    <div id="sidebar-left" class="span2">
        <div class="row-fluid actions">
            <input type="text" class="search span12" placeholder="Search">
        </div>
        <div class="nav-collapse sidebar-nav">
            <ul class="nav nav-tabs nav-stacked main-menu">
                <li><a href="EventsCalender.aspx"><i class="icon-calendar"></i><span class="hidden-tablet">
                    Calendar</span></a></li>
                <li><a href="UsersManagement.aspx"><i class="icon-user"></i><span class="hidden-tablet">
                    Users</span></a></li>
                <li><a href="SendInvites.aspx"><i class="icon-align-justify"></i><span class="hidden-tablet">
                    Invite</span></a></li>
            </ul>
        </div>
    </div>
    <!-- end: Main Menu -->
    <!-- start: Content -->
    <div id="content" class="span10">
        <div class="row-fluid">
            <div class="box span12">
                <div class="box-header">
                    <h2>
                        <i class="icon-wrench"></i>Email Setting</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-setting"><i class="icon-wrench"></i></a><a href="#" class="btn-minimize">
                            <i class="icon-chevron-up"></i></a><a href="#" class="btn-close"><i class="icon-remove">
                            </i></a>
                    </div>
                </div>
                <div class="box-content">
                    <form class="form-horizontal">
                    <fieldset>
                        <div class="control-group">
                            <asp:HiddenField ID="hfEmailID" ClientIDMode="Static" runat="server" />
                            <label class="control-label" for="typeahead">
                                Email
                            </label>
                            <div class="controls">
                                <input type="text" name="tags" id="txtEmail" class="validate[required,custom[email]]" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="typeahead">
                                Username
                            </label>
                            <div class="controls">
                                <input type="text" name="tags" id="txtUsername" class="validate[required]" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="typeahead">
                                SMTP
                            </label>
                            <div class="controls">
                                <input type="text" name="tags" id="txtSMTP" class="validate[required]" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="typeahead">
                                Port
                            </label>
                            <div class="controls">
                                <input type="text" name="tags" id="txtPort" class="validate[required,custom[integer]]" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="typeahead">
                                Password
                            </label>
                            <div class="controls">
                                <input type="password" name="tags" id="txtPassword" class="validate[required]" />
                            </div>
                        </div>
                        <div class="control-group hidden-phone">
                            <label class="control-label" for="textarea2">
                                SSL</label>
                            <div class="controls">
                                <input id="chkbSSL" name="chkbSSL" type="checkbox" />
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn btn-primary" onclick="fnSaveSettings()">
                                Save Settings</button>
                        </div>
                    </fieldset>
                    </form>
                </div>
            </div>
            <!--/span-->
        </div>
        <!--/row-->
    </div>
    <!-- end: Content -->
</asp:Content>
