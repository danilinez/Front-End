<%@ page title="" language="C#" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_ManageUsers, App_Web_zarixrtn" enableeventvalidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        input, select, textarea
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            padding: 2px 0;
        }
        body
        {
            line-height: 1;
            font-family: Arial, Helvetica, sans-serif;
            background: #f8f5ec;
        }
        ol, ul
        {
            list-style: none;
        }
        blockquote, q
        {
            quotes: none;
        }
        blockquote:before, blockquote:after, q:before, q:after
        {
            content: '';
            content: none;
        }
        /* remember to define focus styles! */:focus
        {
            outline: 0;
            -moz-outline: none;
        }
        /* remember to highlight inserts somehow! */ins
        {
            text-decoration: none;
        }
        del
        {
            text-decoration: line-through;
        }
        /* tables still need 'cellspacing="0"' in the markup */table
        {
            border-collapse: collapse;
            border-spacing: 0;
        }
        /* reset styles ended *//* text box  starts here */#content .titlebarLeftc, .titlebarLeftc
        {
            background: url(images/title_bar_leftc.gif) no-repeat;
            height: 28px;
        }
        #content .titlebarRightc, .titlebarRightc
        {
            background: url(images/title_bar_rightc.gif) no-repeat right top;
            height: 28px;
        }
        #content .titlebar, .titlebar
        {
            background: url(images/title_bar_bg.gif) repeat-x left top;
            height: 28px;
            margin: 0 8px;
        }
        /* text box  end here *//* input buttons  starts here */.ybtn_s
        {
            background: url(images/ybtn_small.png) no-repeat;
            width: 69px;
            height: 20px;
            border: 0px;
            font-weight: bold;
            color: #3b3f41;
            font-size: 11px;
        }
        .gbtn_s
        {
            background: url(images/gbtn_small.png) no-repeat;
            width: 69px;
            height: 20px;
            border: 0px;
            font-weight: bold;
            color: #3b3f41;
            font-size: 11px;
        }
        .gbtn_s:active
        {
            background: url(images/gbtn_small_active.png) no-repeat;
        }
        /*---popup styles starts here ----- */.popupGrayBg
        {
            position: fixed;
            width: 100%;
            height: 100%;
            background: black;
            z-index: 1001;
            left: 0;
            top: 0;
            opacity: .5;
            filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=50);
        }
        .QTPopupCntnr
        {
            width: 487px;
            position: fixed;
            z-index: 1200;
            background: gray;
            left: 50%;
            top: 50%;
            margin-left: -244px;
            margin-top: -276px;
        }
        .gpBdrLeftTop
        {
            width: 6px;
            height: 6px;
            background: url(images/greenPopupBdr.png) left top no-repeat;
            float: left;
        }
        .gpBdrRightTop
        {
            width: 6px;
            height: 6px;
            background: url(images/greenPopupBdr.png) right top no-repeat;
            float: right;
        }
        .gpBdrTop
        {
            height: 3px;
            background: #a9b6e1;
            border-top: 3px solid #3b4f91;
            margin-left: 6px;
            margin-right: 6px;
        }
        .gpBdrLeft
        {
            border-left: 3px solid #3b4f91;
            background: #fff;
        }
        .highlightRow
        {
            background-color: #dadada;
        }
        .gpBdrRight
        {
            border-right: 3px solid #3b4f91;
            background: #fff;
            min-height: 400px;
            position: relative;
        }
        .gpBdrLeftBottom
        {
            width: 6px;
            height: 6px;
            background: url(images/greenPopupBdr.png) left bottom no-repeat;
            float: left;
        }
        .gpBdrRightBottom
        {
            width: 6px;
            height: 6px;
            background: url(images/greenPopupBdr.png) right bottom no-repeat;
            float: right;
        }
        .gpBdrBottom
        {
            height: 3px;
            background: #fff;
            border-bottom: 3px solid #3b4f91;
            margin-left: 6px;
            margin-right: 6px;
        }
        .gpBdrRight .caption
        {
            background: #a9b6e1;
            line-height: 38px;
            padding-left: 10px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 15px;
            font-weight: bold;
            color: #3b4f91;
        }
        .gpBdrRight .closeBtn
        {
            background: red;
            width: 31px;
            height: 31px;
            position: absolute;
            right: -15px;
            top: -15px;
            background: url(images/grn_pp_cls_btn_normal.png) no-repeat;
        }
        .gpBdrRight .closeBtn:hover
        {
            background: url(images/grn_pp_cls_btn_over.png) no-repeat;
        }
        .gpBdrRight .content
        {
            padding: 25px;
            font-weight: normal;
        }
        /*---popup styles ends here ----- */.style1
        {
            font-size: 14px;
            color: #256C89;
            font-weight: bold;
            height: 14px;
        }
    </style>
    <%--<script src="popupscript/jquery.js" type="text/javascript"></script>--%>
    <script type="text/javascript">

        $(document).ready(function () {

            $(".QTPopup").css('display', 'none') // set the popup display none default
            $(".lnchPopop").click(function () { // launch the popup
                $(".QTPopup").animate({ width: 'show' }, 'slow');
            });
            $(".closeBtn").click(function () { // close the popup
                $(".QTPopup").css('display', 'none');
            });
            $("#form1").validationEngine();

        })

        var newEntry;
        var row;
        var idiCompanyID, idsTypeName, idiCompanyTypeID, idsAddress, idsCompanyName, idsEmail, idsPostcode, hfAdminCompanyID, hfUserID;


        function fnLoadCompanies() {

            idsTypeName = $("#ddlCompanyTypes option:selected").text();
            idiCompanyTypeID = $("#ddlCompanyTypes option:selected").val();

            return $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnFetchCompaniesByType",
                data: "{'iCompanyTypeID':'" + idiCompanyTypeID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: fnSuccessHandler
            });

        }

        function fnSuccessHandler(response) {

            var ddlCompanies = $('select[id$=ddlCompanies]');
            ddlCompanies.empty();
            var data = response.d;
            var listItems = [];
            listItems.push('<option value="">[--Please-Select--]</option>');
            for (var key in data) {
                listItems.push('<option value="' + data[key].iCompanyID + '">' + data[key].sCompanyName + '</option>');
            }
            $(ddlCompanies).append(listItems.join(''));
        }

        function fnDeleteUser(deleteButton, sUserID) {
            row = $(deleteButton).parent().parent();

            var agree = confirm("Are you sure you want to delete this record?");
            if (!agree)
                return false;

            idiCompanyID = $("#idiCompanyID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnDeleteCompany",
                data: "{'iCompanyID':'" + idiCompanyTypeID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == 1) {
                        __doPostBack('__Page', '');
                    }
                    else if (result == 2) {

                        alert('Can not delete record, already in use!');
                    }

                    else if (result == 0) {
                        alert('There is some propblem in deleting record');
                    }
                },
                failure: function (msg) {
                    alert(msg);
                }
            });
            return false;
        }

        function FillEditDialog(editButton, sUserID) {

            row = $(editButton).parent().parent();
            $("#hfUserID").val(sUserID);
            $("#lblTitle").text("Edit User");
            var param = new Object();
            param.sUserID = sUserID;
            param.iAdminCompanyID = ''+<%= Session["iAdminCompanyID"] %>+'';
            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnEditUserDetails",
                data: JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                 var obj = jQuery.parseJSON(msg.d);

                 $.each(obj, function (index, value) {
//ddlCompanyTypes ddlCompanies ddlUserTypes txtFullName txtEmail txtUserName txtPassword txtPostCode

          
                if(value.iCompanyTypeID.toString()!='0')
                {
                $( "#ddlCompanyTypes" ).val(value.iCompanyTypeID);            
                   
                  $.when(fnLoadCompanies()).done(function(){
                try {
                
                if(value.iCompanyID.toString()!='0')
                            $("#ddlCompanies").val(value.iCompanyID);
                
                $("#ddlUserTypes").val(value.iUserTypeID);
                } catch (e) {
    
                }
                                  
                   $("#txtFullName").val(value.sName);
                   $("#txtEmail").val(value.sEmail);
                   $("#txtUserName").val(value.sUserName);
                   $("#txtPassword").val(value.sPassword);
                   $("#txtPostCode").val(value.sPostcode);
                   if(value.btIsActive)
                   $("#chkbActive").attr("checked","checked");
                   else
                   $("#chkbActive").attr("checked","");
                  DisplayEditDialog();
                  });
                    }
                    else{
                    
                     $("#txtFullName").val(value.sName);
                   $("#txtEmail").val(value.sEmail);
                   $("#txtUserName").val(value.sUserName);
                   $("#txtPassword").val(value.sPassword);
                   $("#txtPostCode").val(value.sPostcode);
                   if(value.btIsActive)
                   $("#chkbActive").attr("checked","checked");
                   else
                   $("#chkbActive").attr("checked","");
                  DisplayEditDialog();
                    
                    }

                    });
                }
                
            });

            

        }
        function DisplayEditDialog() {
            newEntry = "0";
            $(".QTPopup").animate({ width: 'show' }, 'slow');
        }

        function fnResetForm()
        {
                    $("#txtFullName").val("");
                   $("#txtEmail").val('');
                   $("#txtUserName").val('');
                   $("#txtPassword").val('');
                   $("#txtPostCode").val('');
                  
                   $("#chkbActive").attr("checked","checked");
                  
        }

        function fnAddNewDialog() {
            newEntry = "1";
            idiCompanyID = 0;
            $("#hfUserID").val("");
            $("#lblTitle").text("Add New User");
            fnResetForm();
            $(".QTPopup").animate({ width: 'show' }, 'slow');

        }
        function UpdateValues(e) {

            if($("#form1").validationEngine("validate"))
            {
            $("#hfUserTypeID").val($('#ddlCompanies').val());
               return true;          
            }
            else
            return false;
        }

        function HideLabel() {
            document.getElementById('<%= lblSuccessMessage.ClientID %>').style.display = "none";
        }
        setTimeout("HideLabel();", 5000);

        function CloseEditDialog() {
            //            row.removeClass("highlightRow");
            $(".QTPopup").css('display', 'none');
        }
    </script>
    <table width="968" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="968" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top">
                            &nbsp;<asp:HiddenField ID="hfAdminCompanyID" runat="server" />
                            <asp:HiddenField ID="hfUserID" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hfUserTypeID" runat="server" ClientIDMode="Static" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="5" height="5">
                                                </td>
                                                <td>
                                                </td>
                                                <td width="5">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mainboxheading">
                                                                    <tr>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="6" height="6">
                                                                                    </td>
                                                                                    <td>
                                                                                    </td>
                                                                                    <td width="6">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td align="left">
                                                                                                    Manage User(s)
                                                                                                </td>
                                                                                                <td width="15">
                                                                                                    <img src="images/bullet-heading-right.png" width="15" height="16" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td width="3" height="6">
                                                                                    </td>
                                                                                    <td>
                                                                                    </td>
                                                                                    <td width="3">
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="5">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="5">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <input id="btnAddNew" type="button" class="gbtn_s" value="Add New" onclick="javascript:fnAddNewDialog();" />
                                                                            <%--  <asp:Button ID="btnAddNew" CssClass="gbtn_s" runat="server" Text="Add New" ValidationGroup="grpValidateCompanyType"
                                                                                CausesValidation="true" OnClientClick="fnAddNewDialog();" />--%>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblSuccessMessage" ClientIDMode="Static" ForeColor="DarkGreen" Font-Bold="true"
                                                                                Font-Size="11px" runat="server" Text="" Width="120px"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="5">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <table width="900" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                    <thead>
                                                                        <tr>
                                                                            <td style="width: 180px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                Name
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                User Type
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 150px" class="grid-header">
                                                                                Company Name
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 70px" class="grid-header">
                                                                                Username
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 150px" class="grid-header">
                                                                                Email
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 70px" class="grid-header">
                                                                                Active
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 40px" class="grid-header">
                                                                                Action
                                                                            </td>
                                                                        </tr>
                                                                    </thead>
                                                                    <asp:ListView ID="lstUsers" runat="server">
                                                                        <LayoutTemplate>
                                                                            <tbody>
                                                                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                            </tbody>
                                                                        </LayoutTemplate>
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idsName" title='<%# Eval("sName") %>'>
                                                                                        <%# Eval("sName") %></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsTypeName" title='<%# Eval("sUserType") %>'>
                                                                                        <%# Eval("sUserType") %></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsCompanyName" title='<%# Eval("sCompanyName") %>'>
                                                                                        <%# Eval("sCompanyName")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsUsername" title='<%# Eval("sUserName") %>'>
                                                                                        <%# Eval("sUserName")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsEmail" title='<%# Eval("sEmail") %>'>
                                                                                        <%# Eval("sEmail") %></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <asp:CheckBox ID="CheckBox1" Enabled="false" runat="server" Checked='<%# Eval("btIsActive") %>' />
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <img src="images/icon-view-edit.png" style="cursor: pointer" onclick="javascript:FillEditDialog(this,'<%# Eval("iUserID")%>');"
                                                                                        width="9" height="10" />&nbsp;
                                                                                   </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <AlternatingItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idsName" title='<%# Eval("sName") %>'>
                                                                                        <%# Eval("sName")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsTypeName" title='<%# Eval("sUserType") %>'>
                                                                                        <%# Eval("sUserType")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsCompanyName" title='<%# Eval("sCompanyName") %>'>
                                                                                        <%# Eval("sCompanyName") %>
                                                                                    </span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsUsername" title='<%# Eval("sUserName") %>'>
                                                                                        <%# Eval("sUserName") %>
                                                                                    </span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsEmail" title='<%# Eval("sEmail") %>'>
                                                                                        <%# Eval("sEmail") %>
                                                                                    </span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <asp:CheckBox ID="CheckBox1" Enabled="false" runat="server" Checked='<%# Eval("btIsActive") %>' />
                                                                                    
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <img src="images/icon-view-edit.png" style="cursor: pointer" onclick="javascript:FillEditDialog(this,'<%# Eval("iUserID")%>');"
                                                                                        width="9" height="10" />&nbsp;
                                                                                        </td>
                                                                            </tr>
                                                                        </AlternatingItemTemplate>
                                                                    </asp:ListView>
                                                                    <tfoot class="paging">
                                                                        <tr>
                                                                            <td height="30" colspan="25">
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="10" height="5">
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                        <td width="10">
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td align="right">
                                                                                            <asp:DataPager ID="dtpUsers" Visible="true" PageSize="20" runat="server" PagedControlID="lstUsers"
                                                                                                OnPreRender="dtpUsers_PreRender">
                                                                                                <Fields>
                                                                                                    <asp:NextPreviousPagerField PreviousPageText="« Previous" FirstPageText="First" NextPageText=""
                                                                                                        ButtonCssClass="grid_pagi_bg_a1" />
                                                                                                    <asp:NumericPagerField NumericButtonCssClass="grid_pagi_bg_a2" />
                                                                                                    <asp:NextPreviousPagerField NextPageText="Next »" PreviousPageText="" LastPageText="Last"
                                                                                                        ButtonCssClass="grid_pagi_bg_a1" />
                                                                                                </Fields>
                                                                                            </asp:DataPager>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="10" height="5">
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                        <td width="10">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </tfoot>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="5" height="5">
                                                </td>
                                                <td>
                                                </td>
                                                <td width="5">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <div class="QTPopup">
                                <div class="popupGrayBg">
                                </div>
                                <div class="QTPopupCntnr">
                                    <div class="gpBdrLeftTop">
                                    </div>
                                    <div class="gpBdrRightTop">
                                    </div>
                                    <div class="gpBdrTop">
                                    </div>
                                    <div class="gpBdrLeft">
                                        <div class="gpBdrRight">
                                            <div class="caption">
                                                <span id="lblTitle">Add New User</span>
                                            </div>
                                            <a href="#" class="closeBtn" title="Close"></a>
                                            <div class="content">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            Company Type<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                ErrorMessage="*" InitialValue="" ControlToValidate="ddlCompanyTypes" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:DropDownList ID="ddlCompanyTypes" ClientIDMode="Static" CssClass="validate[required]"
                                                                            onchange="javascript:fnLoadCompanies();" runat="server" Style="border: 0px; background: none;
                                                                            margin-top: 4px; width: 245px; background-color: transparent;">
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Company
                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                                                ControlToValidate="ddlCompanies" InitialValue="-1" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>--%>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:DropDownList ID="ddlCompanies" ClientIDMode="Static" runat="server" Style="border: 0px;
                                                                            background: none; margin-top: 4px; width: 245px; background-color: transparent;">
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            User Type
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:DropDownList ID="ddlUserTypes" ClientIDMode="Static" runat="server" Style="border: 0px;
                                                                            background: none; margin-top: 4px; width: 245px; background-color: transparent;">
                                                                            <asp:ListItem Value="1">Medical Expert</asp:ListItem>
                                                                            <asp:ListItem Value="2">Pharmasist</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            First Name
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtFullName" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtFullName" clientidmode="Static" class="validate[required]"
                                                                            runat="server" value="" style="border: 0px; background: none; margin-top: 5px;
                                                                            width: 245px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Email<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                ErrorMessage="*" ControlToValidate="txtEmail" ValidationGroup="grpValidateExpertDetials"
                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtEmail" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtEmail" clientidmode="Static" runat="server" class="validate[required,custom[email]]"
                                                                            value="" style="border: 0px; background: none; margin-top: 5px; width: 245px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Username
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtUserName" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtUserName" clientidmode="Static" class="validate[required]"
                                                                            runat="server" value="" style="border: 0px; background: none; margin-top: 5px;
                                                                            width: 245px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Password
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtPassword" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtPassword" clientidmode="Static" class="validate[required]"
                                                                            runat="server" value="" style="border: 0px; background: none; margin-top: 5px;
                                                                            width: 245px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Postcode
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtPostCode" runat="server" value="" style="border: 0px; background: none;
                                                                            margin-top: 5px; width: 245px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Active
                                                        </td>
                                                        <td width="260">
                                                            <asp:CheckBox ID="chkbActive" ClientIDMode="Static" runat="server" Checked="true" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="btnSaveDetails" CssClass="gbtn_s" runat="server" Text="Save" ValidationGroup="grpValidateExpertDetials"
                                                                CausesValidation="true" OnClientClick="UpdateValues();" OnClick="btnSaveDetails_Click" />
                                                            <input id="btnCancel" type="button" class="gbtn_s" value="Cancel" onclick="javascript:CloseEditDialog();" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblMessage" Font-Size="11px" Font-Bold="true" runat="server" Text="saved"
                                                                Style="display: none;"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="gpBdrLeftBottom">
                                    </div>
                                    <div class="gpBdrRightBottom">
                                    </div>
                                    <div class="gpBdrBottom">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
