<%@ page title="" language="C#" masterpagefile="~/ControlPanel/Admin.master" autoeventwireup="true" inherits="ControlPanel_UsersManagement, App_Web_jx024tsd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validationEngine();
            $('#txtDOB').datepicker();
            fnLoadUsers();
            fnLoadUserTypes();
        });

        var sValidEmail = "0";
        var sValidUsername = "0";

        function fnLoadUsers() {

            var param = new Object();
            param.sUserID = ''+<%= Session["objUID"] %>+'';

              $.ajax({
                    type: "POST",
                    url: "UsersManagement.aspx/fnLoadUsers",
                    data: JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                       if (msg.d.length > 0) {
                  
                    var obj = jQuery.parseJSON(msg.d);
                      try {
                            $('#tblAllUsers').dataTable().fnClearTable();
                            $('#tblAllUsers').dataTable().fnDestroy();
                    } catch (e) {
                    }

                    var aaData=[];

                    $.each(obj, function (index, value) {

                    var strStatus = "<input id='Checkbox1"+value.iUserAccountID+"' name='Checkbox1"+value.iUserAccountID+"' type='checkbox' checked='checked' onchange=\"fnChangeStatus('"+value.iUserAccountID+"',this)\"/>";

                    if(!value.btIsActive)
                    {
                    strStatus = "<input id='Checkbox"+value.iUserAccountID+"' name='Checkbox1"+value.iUserAccountID+"' type='checkbox'  onchange=\"fnChangeStatus('"+value.iUserAccountID+"',this)\"/>";
                    }                                    

                   aaData.push([
                        "<span data-toggle='tooltip' data-placement='top' title='' class='tooltiphere' data-original-title='"+value.sName+"'> "+value.sName+" </span>",
		"<span data-toggle='tooltip' data-placement='top' title='' class='tooltiphere' data-original-title='"+value.sUserName+"'> "+value.sUserName+"</span>",        
        "<span data-toggle='tooltip' data-placement='top' title='' class='tooltiphere' data-original-title='"+value.sEmail+"'> "+value.sEmail+"</span>",  
        "<span data-toggle='tooltip' data-placement='top' title='' class='tooltiphere' data-original-title='"+value.sPhoneNumber+"'> "+value.sPhoneNumber+"</span>",  
        "<span data-toggle='tooltip' data-placement='top' title='' class='tooltiphere' data-original-title='"+value.sPostalCode+"'> "+value.sPostalCode+"</span>",  
        "<span data-toggle='tooltip' data-placement='top' title='' class='tooltiphere' data-original-title='"+value.sCity+"'> "+value.sCity+"</span>",  
        "<span data-toggle='tooltip' data-placement='top' title='' class='tooltiphere' data-original-title='"+value.sState+"'> "+value.sState+"</span>",  
        strStatus,        
        "<a class='btn btn-info' href='#' onclick=\"fnEditUser('"+value.iUserAccountID+"')\"><i class='icon-edit '></i></a><a class='btn btn-danger' href='#'  onclick=\"fnDeleteUser('"+value.iUserAccountID+"',this)\"><i class='icon-trash '></i></a>" 
       
        ]);
                    });   
                    $(".dataTables_processing").attr('style', 'display:none');
                }
                else {
                    try {
                            $('#tblAllUsers').dataTable().fnClearTable();
                            $('#tblAllUsers').dataTable().fnDestroy();
                    } catch (e) {
                    }
                }

                $('#tblAllUsers').dataTable({                     
                    "aaData": aaData, 
                    "bProcessing": true,
                    "bDeferRender": true                               
            });          
            $(".dataTables_processing").attr('style', 'display:none');

            $('.tooltiphere').tooltip('hide');

                    }
                });
        }

        function fnChangeStatus(sUserID,currentRow)
        {
            var isactive = "1";
            if($("#Checkbox1"+sUserID+"")[0].checked)
            {
                isactive = "1";
            }
            else
                isactive = "0";        

            var param = new Object();
            param.sUserID = sUserID;
            param.isActive = isactive;
  
           return $.ajax({
                type: "POST",
                cache: false,
                url: "UsersManagement.aspx/fnChangeUserStatus",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                   if(msg.d=="-1")                   
                   {
                    alert("Problem in Updating Status");
                   }
                }
            });      
        }

        function fnEditUser(sUserID)
        {
            var param = new Object();
            param.sUserID = sUserID;              
            return $.ajax({
                type: "POST",
                cache: false,
                url: "UsersManagement.aspx/fnEditUser",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {
                  
                    var obj = jQuery.parseJSON(msg.d);
                     
                    $.each(obj, function (index, value) {
                    
                    $("#hfUserID").val(value.iUserAccountID);
                    $("#ddlUserTypes").val(value.iUserTypeID);
                    $("#txtFN").val(value.sFirstName);
                    $("#txtLN").val(value.sLastName); 
                    $("#txtEmail").val(value.sEmail); 
                    $("#txtPhone").val(value.sPhoneNumber);
                    $("#txtMobile").val(value.sMobileNumber);
                    $("#txtAddress").val(value.sAddress); 
                    $("#txtCity").val(value.sCity);
                    $("#txtPostCode").val(value.sPostalCode);
//                    $("#txtDOB1").val(value.dtDOB1);
                    $("#txtUN").val(value.sUserName);
                    $("#txtPswd").val(value.sPassword);
                    $("#ddlState").val(value.sState);
                    $("#ddlCountry").val(value.sCountry);
                    if(value.btIsActive)
                    {
                    $('#chkbActive').prop('checked',value.btIsActive);
//                    $("#chkbActive")[0].checked = true;
                       // $('input[name=chkbActive]').attr('checked', true);
                        }
                    else
                    {

                    $('#chkbActive').prop('checked',value.btIsActive);
                    
                    
                    //    $('input[name=chkbActive]').attr('checked', false);
                        }

                        //$('input[name="chkbActive"]:checked')
                  
          
                    }); 
                    $("#lblMode").text("Edit User");
                    $("#btnAddUser").click(); 
                    
                }                  
                }
            }); 
        }
        function fnDeleteUser(sUserID,currentRow)
        {
        var param = new Object();
        param.sUserID = sUserID;
        
        return $.ajax({
                type: "POST",
                cache: false,
                url: "UsersManagement.aspx/fnDeleteUser",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {
                       if(msg.d=="1")
                       {
                       $("#tblAllUsers").dataTable().fnDeleteRow(currentRow.parentNode.parentNode._DT_RowIndex);
                       }
                       else
                       {
                       alert('Problem in Deleting Record');
                       }
                    }                    
                }
            });    
        
        }

        function fnValidateEmailTaken()
        {
            var param = new Object();
            param.sUserID = $("#hfUserID").val();
            param.sEmail = $("#txtEmail").val();
  
           return $.ajax({
                type: "POST",
                cache: false,
                url: "UsersManagement.aspx/fnValidateEmailTaken",
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

        function fnValidateUserNameTaken()
        {
            var param = new Object();
            param.sUserID = $("#hfUserID").val();
            param.sUserName = $("#txtUN").val();
  
            return $.ajax({
                    type: "POST",
                    cache: false,
                    url: "UsersManagement.aspx/fnValidateUserNameTaken",
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

        function fnLoadUserTypes()
        {
                
           return $.ajax({
                type: "POST",
                cache: false,
                url: "UsersManagement.aspx/fnLoadUserTypes",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d.length > 0) {
                        $("#ddlUserTypes").empty();
                        var obj = jQuery.parseJSON(msg.d)
                        $.each(obj, function (index, value) {
                            $("#ddlUserTypes").append('<option value="' + value.iUserTypeID + '">' + value.sUserTypeName + '</option>');
                        });
                    }
                    else {
                        $("#ddlUserTypes").empty();
                    }
                }
            });
        
        }

        function fnSaveUser()
        {
            if($("#form1").validationEngine("validate"))            
            {                
                var objFLU = $('#fleProfilePic');
                $.when(fnValidateEmailTaken(),fnValidateUserNameTaken()).done(function(){

                    if(sValidEmail=='1')
                    {
                        alert('Email already taken!');
                        return;
                    }

                    if(sValidUsername == '1')
                    {
                        alert('Username already taken!');
                        return;
                    }

                    var objParam = new Object();

                    objParam.sUserID =  $("#hfUserID").val();
                    objParam.sUserTypeID = $("#ddlUserTypes option:selected").val();
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
                    
                    if($('input[name="chkbActive"]:checked'))
                        objParam.sStatus = "1"; 
                    else
                        objParam.sStatus = "0"; 

                    
                    objParam.sPostalCode = $("#txtPostCode").val(); 
//                    objParam.sDOB = $("#txtDOB1").val(); 
                    
                   

                    $.ajax({
                    type: "POST",
                    cache: false,
                    url: "UsersManagement.aspx/fnSaveUser",
                    data: JSON.stringify(objParam),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d.length > 0) {
                          if(msg.d=="-1") 
                          {
                          alert("Problem in Saving User");
                          return;
                          }
                          else
                          {
//                           $('#fleProfilePic') =  objFLU;
                          var imgVal = $('#fleProfilePic').val();
                       
                              if(imgVal!='')
                              {
                                $("#hfUserID").val(msg.d);                          
                                $('#LinkButton1').click();  
                                                              
                              }
                              else
                              {
                                fnLoadUsers();
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
            else
            {
            return;
            }        
        }
        function fnAddNewUser()
        {
            fnResetForm();
            $("#hfUserID").val('');
            $("#lblMode").text("Add New User");
            $("#btnAddUser").click();        
        }
        
        function fnResetForm()
        {
            $("#txtFN").val(''); 
            $("#txtLN").val('');  
            $("#txtEmail").val(''); 
//            $("#txtDOB1").val('');  
            $("#txtUN").val('');  
            $("#txtPswd").val('');  
            $("#txtMobile").val('');  
            $("#txtAddress").val('');  
            $("#txtPhone").val('');  
           
            $("#txtPostCode").val(''); 
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
                <%--<li><a href="messages.html"><i class="icon-dashboard"></i><span class="hidden-tablet">
                    Messages</span></a></li>
                <li><a href="settings.html"><i class="icon-edit"></i><span class="hidden-tablet">Settings</span></a></li>
                --%><li><a href="SendInvites.aspx"><i class="icon-align-justify"></i><span class="hidden-tablet">
                    Invite</span></a></li>
            </ul>
        </div>
    </div>
    <!-- end: Main Menu -->
    <!-- start: Content -->
    <div id="content" class="span10">
        <div class="row-fluid">
            <div class="box span12">
                <div class="box-header" data-original-title>
                    <h2>
                        <i class="icon-user"></i><span class="break"></span>Users</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-minimize"><i class="icon-chevron-up"></i></a><a href="#" class="btn-plus"
                            onclick="fnAddNewUser()"><i class="icon-plus"></i></a>
                    </div>
                </div>
                <div class="box-content">
                    <asp:Button ID="LinkButton1" ClientIDMode="Static" runat="server" Text="used" Style="display: none"
                        OnClick="LinkButton1_Click" />
                    <asp:HiddenField ID="hfUserID" runat="server" ClientIDMode="Static" />
                    <table class="table table-striped table-bordered bootstrap-datatable datatable" id="tblAllUsers">
                        <thead>
                            <tr>
                                <th style="width: 120px">
                                    Name
                                </th>
                                <th>
                                    Username
                                </th>
                                <th>
                                    Email
                                </th>
                                <th>
                                    Phone
                                </th>
                                <th>
                                    Post Code
                                </th>
                                <th>
                                    City
                                </th>
                                <th>
                                    State
                                </th>
                                <th>
                                    Status
                                </th>
                                <th>
                                    Actions
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
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
                        <label class="control-label" for="ddlUserTypes">
                            User Type</label>
                        <div class="controls">
                            <select id="ddlUserTypes">
                            </select>
                        </div>
                    </div>
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
                  <%--  <div class="control-group">
                        <label class="control-label" for="txtDOB1">
                            Date of Birth</label>
                        <div class="controls">
                            <div class="input-append date" id="txtDOB" data-date="" data-date-format="dd/mm/yyyy">
                                <input size="16" type="text" id="txtDOB1" value="" class="validate[required,custome[dateFormat]]"
                                    readonly="readonly">
                                <span class="add-on"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>--%>
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
                            <%--<input class="input-file uniform_on" id="fleProfilePic" type="file">--%>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="chkbActive">
                            Active</label>
                        <div class="controls">
                            <asp:CheckBox ID="chkbActive" name="chkbActive" runat="server" ClientIDMode="Static" />
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
