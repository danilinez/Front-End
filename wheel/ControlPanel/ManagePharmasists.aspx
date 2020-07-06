<%@ page title="" language="C#" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_ManagePharmasists, App_Web_zarixrtn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="css/popupCSS.css" rel="stylesheet" type="text/css" />
    <script src="popupscript/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $(".QTPopup").css('display', 'none') // set the popup display none default
            $(".lnchPopop").click(function () { // launch the popup
                $(".QTPopup").animate({ width: 'show' }, 'slow');
            })
            $(".closeBtn").click(function () { // close the popup
                $(".QTPopup").css('display', 'none');
            })
        })

        var newEntry;
        var row;
        var idiContactID, idsGender, idsPostCode, idsFirstName, idsLastName, idsPassword, idsAddress, idsEmail, idsUsername, idsName, idiUserID, idsTypeName, idiUserTypeID, idiCompanyID, idsCompanyName, hfAdminCompanyID, hfUserID, idsCountry;
        function fnLoadCountry() {
            var postCode = document.getElementById("<%= txtPostCode.ClientID %>");
            postCode.value = postCode.value.replace(/\s/g, '');

            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnLoadCountry",
                data: "{'sPostcode':'" + postCode.value.toString() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == "") {
                        alert("Invalid ZipCode/PostCode");
                        postCode.focus();
                    }
                    else if (result != "") {

                        var dropdownlistboxCountry = document.getElementById("<%= ddlCountry.ClientID %>")

                        for (var x = 0; x < dropdownlistboxCountry.length; x++) {
                            if (result == dropdownlistboxCountry.options[x].value.toString()) {
                                dropdownlistboxCountry.selectedIndex = x;
                                break;
                            }
                        }
                    }

                },
                failure: function (msg) {
                    alert(msg);
                }

            });
            return false;

        }
        function fnUpdateUserStatus(activeButton) {
            //            chkbActivate
            row = $(activeButton).parent().parent();


            idiContactID = $("#idiContactID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiUserID = $("#idiUserID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");

            //            alert("Changed, new value = " + activeButton.checked.toString());

            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnUpdateUserStatus",
                data: "{'iContactID':'" + idiContactID + "', 'iUserID':'" + idiUserID + "', 'sstatus':'" + activeButton.childNodes[0].checked.toString() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == 1) {

                    }

                    else if (result == 0) {
                        alert('Problem in Updating Status');

                        if (activeButton.checked == true)
                            activeButton.checked = false;
                        else if (activeButton.checked == false)
                            activeButton.checked = true;
                    }
                },
                failure: function (msg) {
                    alert(msg);
                }
            });
            return false;


        }

        function DeleteUsers(deleteButton) {
            row = $(deleteButton).parent().parent();

            var agree = confirm("Are you sure you want to delete this record?");
            if (!agree)
                return false;

            idiContactID = $("#idiContactID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiUserID = $("#idiUserID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");

            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnDeleteUser",
                data: "{'iContactID':'" + idiContactID + "', 'iUserID':'" + idiUserID + "'}",
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
                        alert('Can not delete record, already in use');
                    }
                },
                failure: function (msg) {
                    alert(msg);
                }
            });
            return false;
        }

        function FillEditDialog(editButton) {

            row = $(editButton).parent().parent();

            //            idsPassword, idsAddress, idsEmail, idsUsername, idsName, idiUserID, idsTypeName, idiUserTypeID, idiCompanyID, idsCompanyName,
            idiContactID = $("#idiContactID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiCompanyID = $("#idiCompanyID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsCompanyName = $("#idsCompanyName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiUserTypeID = $("#idiUserTypeID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiUserID = $("#idiUserID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsName = $("#idsName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsUsername = $("#idsUsername", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsEmail = $("#idsEmail", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsAddress = $("#idsAddress", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsPassword = $("#idsPassword", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsFirstName = $("#idsFirstName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsLastName = $("#idsLastName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsPostCode = $("#idsPostCode", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsCountry = $("#idsCountry", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsGender = $("#idsGender", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            document.getElementById("lblTitle").innerHTML = "Edit Pharmasist";


            DisplayEditDialog();
            return false;
        }
        function DisplayEditDialog() {
            newEntry = "0";
            //            ddlCompanies txtFirstName txtLastName txtEmail txtUserName txtPassword txtPostCode txtAddress
            var dropdownlistbox = document.getElementById("<%= ddlCompanies.ClientID %>")

            for (var x = 0; x < dropdownlistbox.length; x++) {
                if (idiCompanyID == dropdownlistbox.options[x].value) {
                    dropdownlistbox.selectedIndex = x;
                    break;
                }
            }

            var dropdownlistboxCountry = document.getElementById("<%= ddlCountry.ClientID %>")

            for (var x = 0; x < dropdownlistboxCountry.length; x++) {
                if (idsCountry == dropdownlistboxCountry.options[x].value) {
                    dropdownlistboxCountry.selectedIndex = x;
                    break;
                }
            }
            var dropdownlistbox1 = document.getElementById("<%= ddlGender.ClientID %>")

            for (var x = 0; x < dropdownlistbox1.length - 1; x++) {
                if (idsGender == dropdownlistbox1.options[x].value) {
                    dropdownlistbox1.selectedIndex = x;
                    break;
                }
            }


            document.getElementById("<%= txtFirstName.ClientID %>").value = idsFirstName;
            document.getElementById("<%= txtLastName.ClientID %>").value = idsLastName;
            document.getElementById("<%= txtEmail.ClientID %>").value = idsEmail;
            document.getElementById("<%= txtUserName.ClientID %>").value = idsUsername;
            document.getElementById("<%= txtPassword.ClientID %>").value = idsPassword;
            document.getElementById("<%= txtPostCode.ClientID %>").value = idsPostCode;
            document.getElementById("<%= txtAddress.ClientID %>").value = idsAddress;



            $(".QTPopup").animate({ width: 'show' }, 'slow');
        }

        function fnAddNewDialog() {
            newEntry = "1";
            idiUserID = 0;

            var dropdownlistbox = document.getElementById("<%= ddlCompanies.ClientID %>")
            var dropdownlistbox1 = document.getElementById("<%= ddlGender.ClientID %>")

            dropdownlistbox.selectedIndex = 0;
            dropdownlistbox1.selectedIndex = 0;
            var el2 = document.getElementById("<%= ddlCountry.ClientID %>");
            el2.selectedIndex = 0;

            document.getElementById("<%= txtFirstName.ClientID %>").value = "";
            document.getElementById("<%= txtLastName.ClientID %>").value = "";
            document.getElementById("<%= txtEmail.ClientID %>").value = "";
            document.getElementById("<%= txtUserName.ClientID %>").value = "";
            document.getElementById("<%= txtPassword.ClientID %>").value = "";
            document.getElementById("<%= txtPostCode.ClientID %>").value = "";
            document.getElementById("<%= txtAddress.ClientID %>").value = "";

            $(".QTPopup").animate({ width: 'show' }, 'slow');

        }


        function UpdateValues(e) {




            var el = document.getElementById("<%=ddlCompanies.ClientID  %>");
            idsCompanyName = el.options[el.selectedIndex].text;
            idiCompanyID = el.options[el.selectedIndex].value;
            if (idiCompanyID.length < 1 || idiCompanyID == -1) {
                alert("Please Select Company");
                return;
            }
            var ctridsFirstName = document.getElementById("<%= txtFirstName.ClientID %>");
            var ctridsLastName = document.getElementById("<%= txtLastName.ClientID %>");
            var ctridsEmail = document.getElementById("<%= txtEmail.ClientID %>");
            var ctridsUsername = document.getElementById("<%= txtUserName.ClientID %>");
            var ctridsPassword = document.getElementById("<%= txtPassword.ClientID %>");


            if (ctridsFirstName.value.length < 1) {
                ctridsFirstName.focus();
                alert('Please Enter Your First  Name');
                return;
            }
            if (ctridsLastName.value.length < 1) {
                ctridsLastName.focus();
                alert('Please Enter Your Last  Name');
                return;
            }

            if (ctridsEmail.value.length < 1) {
                ctridsEmail.focus();
                alert('Please specify your email address');
                return;
            }
            var check = ctridsEmail.value.indexOf('@', 0)

            // alert('txtComments:' + txtComments.value);
            if (parseInt(check) < 0) {
                ctridsEmail.focus();
                alert('Invalid email address format\nPlease provide a valid email address.');
                return;
            }

            var check2 = ctridsEmail.value.indexOf('.', 0)

            if (parseInt(check2) < 0) {
                ctridsEmail.focus();
                alert('Invalid email address\nEmail address can be like -> userId@mailServer.com');
                return;
            }

            if (ctridsUsername.value.length < 1) {
                ctridsUsername.focus();
                alert('Please Enter Your User  Name');
                return;
            }

            if (ctridsPassword.value.length < 1) {
                ctridsPassword.focus();
                alert('Please Enter Password');
                return;
            }

            if (newEntry == 1) {
                idiContactID = "0";
                idiUserTypeID = "0";
                idiUserID = "0";
                //idiCompanyID = "0";
            }

            var el2 = document.getElementById("<%= ddlCountry.ClientID %>");
            idsCountry = el2.options[el2.selectedIndex].text;
            //            idsCompanyName = $("#<%= ddlCompanies.ClientID %> option:selected").text();
            //                 idiCompanyID = $("#<%= ddlCompanies.ClientID %> option:selected").val();
            idsName = document.getElementById("<%= txtFirstName.ClientID %>").value + ' ' + document.getElementById("<%= txtLastName.ClientID %>").value;
            idsFirstName = document.getElementById("<%= txtFirstName.ClientID %>").value;
            idsLastName = document.getElementById("<%= txtLastName.ClientID %>").value;
            idsUsername = document.getElementById("<%= txtUserName.ClientID %>").value;
            idsEmail = document.getElementById("<%= txtEmail.ClientID %>").value;
            idsAddress = document.getElementById("<%= txtAddress.ClientID %>").value;
            idsPassword = document.getElementById("<%= txtPassword.ClientID %>").value;
            idsPostCode = document.getElementById("<%= txtPostCode.ClientID %>").value;
            idsGender = $("#<%= ddlGender.ClientID %> option:selected").val();

            hfAdminCompanyID = document.getElementById("<%= hfAdminCompanyID.ClientID %>").value;
            hfUserID = document.getElementById("<%= hfUserID.ClientID %>").value;

            idsName = document.getElementById("<%= txtFirstName.ClientID %>").value + ' ' + document.getElementById("<%= txtLastName.ClientID %>").value;


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnSaveMedicalPharmasists",
                //int iContactID,int iCompanyID,int iUserID, string strFirstName,string strLastName,string strUsername, string strPassword, string strEmail, string strAddress, string strGender,string strPostCode,int iAdminCompanyID,int newEntry
                data: "{'iContactID':'" + idiContactID + "', 'iCompanyID':'" + idiCompanyID + "', 'iUserID':'" + idiUserID + "', 'strFirstName':'" + idsFirstName + "', 'strLastName':'" + idsLastName + "', 'strUsername':'" + idsUsername + "', 'strPassword':'" + idsPassword + "', 'strEmail':'" + idsEmail + "', 'strAddress':'" + idsAddress + "', 'strGender':'" + idsGender + "', 'strPostCode':'" + idsPostCode + "', 'iAdminCompanyID':'" + hfAdminCompanyID + "', 'newEntry':'" + newEntry.toString() + "', 'sCountry':'" + idsCountry + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == 1) {

                        $("#idiCompanyID", row).text(idiCompanyID);
                        $("#idsCompanyName", row).text(idsCompanyName);
                        $("#idsCompanyName", row).attr("title", idsCompanyName.toString());
                        $("#idsName", row).text(idsName);
                        $("#idsName", row).attr("title", idsName.toString());
                        $("#idsUsername", row).text(idsUsername);
                        $("#idsEmail", row).text(idsEmail);
                        $("#idsEmail", row).attr("title", idsEmail.toString());
                        $("#idsAddress", row).text(idsAddress);
                        $("#idsPassword", row).text(idsPassword);
                        $("#idsFirstName", row).text(idsFirstName);
                        $("#idsLastName", row).text(idsLastName);
                        $("#idsPostCode", row).text(idsPostCode);


                        $("#idsCountry", row).text(idsCountry);
                        $("#idsCountry", row).attr("title", idsCountry);

                        $("#idsGender", row).text(idsGender);
                        $("#idsGender", row).attr("title", idsGender.toString());

                        CloseEditDialog();


                        if (newEntry == 1)
                            __doPostBack('__Page', '');


                    }
                    else if (result == 2) {


                    }

                    else if (result == 0) {
                        alert('There is some propblem in Saving records');
                    }
                    else if (result == 3) {
                        alert('Invalid ZipCode/PostCode');
                    }
                },
                failure: function (msg) {
                    alert(msg);
                }
            });
            return false;

        }



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
                            <asp:HiddenField ID="hfUserID" runat="server" />
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
                                                                                                    Manage Pharmasists
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
                                                            <td height="5px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <input id="Button2" type="button" class="gbtn_s" style="background: url(images/btn-addnew.png);
                                                                    width: 94px; height: 33px" onclick="javascript:fnAddNewDialog();" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="5px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
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
                                                                            <td style="width: 150px" class="grid-header">
                                                                                Country
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
                                                                                        <%# Eval("sName")%></span> <span id="idsFirstName" style="display: none;">
                                                                                            <%# Eval("sFirstName")%></span><span id="idsLastName" style="display: none;">
                                                                                                <%# Eval("sLastName")%></span><span id="idiUserID" style="display: none;">
                                                                                                    <%# Eval("iUserID")%></span> <span id="idiContactID" style="display: none;">
                                                                                                        <%# Eval("iContactID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsTypeName" title='<%# Eval("sTypeName") %>'>
                                                                                        <%# Eval("sTypeName")%></span> <span id="idiUserTypeID" style="display: none;">
                                                                                            <%# Eval("iUserTypeID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsCompanyName" title='<%# Eval("sCompanyName") %>'>
                                                                                        <%# Eval("sCompanyName")%></span> <span id="idiCompanyID" style="display: none;">
                                                                                            <%# Eval("iCompanyID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsUsername" title='<%# Eval("sUsername") %>'>
                                                                                        <%# Eval("sUsername")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsEmail" title='<%# Eval("sEmail") %>'>
                                                                                        <%# Eval("sEmail")%></span> <span id="idsAddress" style="display: none">
                                                                                            <%# Eval("sAddress")%></span> <span id="idsPassword" style="display: none">
                                                                                                <%# Eval("sPassword")%></span> <span id="idsPostCode" style="display: none">
                                                                                                    <%# Eval("sPostCode")%></span><span id="idsGender" style="display: none">
                                                                                                        <%# Eval("sGender")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsCountry" title='<%# Eval("sCountry") %>'>
                                                                                        <%# Eval("sCountry")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                <asp:CheckBox ID="chkbActivate" runat="server" Checked='<%# Eval("btIsActive") %>' onchange="javascript:fnUpdateUserStatus(this);" />

                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <img src="images/icon-view-edit.png" style="cursor: pointer" onclick="javascript:FillEditDialog(this);"
                                                                                        width="9" height="10" />&nbsp;
                                                                                    <img src="images/icon-delete.png" width="9" height="10" style="cursor: pointer" onclick="javascript:DeleteUsers(this);" />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <AlternatingItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idsName" title='<%# Eval("sName") %>'>
                                                                                        <%# Eval("sName")%></span> <span id="idsFirstName" style="display: none;">
                                                                                            <%# Eval("sFirstName")%></span><span id="idsLastName" style="display: none;">
                                                                                                <%# Eval("sLastName")%></span><span id="idiUserID" style="display: none;">
                                                                                                    <%# Eval("iUserID")%></span><span id="idiContactID" style="display: none;">
                                                                                                        <%# Eval("iContactID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsTypeName" title='<%# Eval("sTypeName") %>'>
                                                                                        <%# Eval("sTypeName")%></span> <span id="idiUserTypeID" style="display: none;">
                                                                                            <%# Eval("iUserTypeID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsCompanyName" title='<%# Eval("sCompanyName") %>'>
                                                                                        <%# Eval("sCompanyName")%></span> <span id="idiCompanyID" style="display: none;">
                                                                                            <%# Eval("iCompanyID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsUsername" title='<%# Eval("sUsername") %>'>
                                                                                        <%# Eval("sUsername")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsEmail" title='<%# Eval("sEmail") %>'>
                                                                                        <%# Eval("sEmail")%></span> <span id="idsAddress" style="display: none">
                                                                                            <%# Eval("sAddress")%></span> <span id="idsPassword" style="display: none">
                                                                                                <%# Eval("sPassword")%></span> <span id="idsPostCode" style="display: none">
                                                                                                    <%# Eval("sPostCode")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsCountry" title='<%# Eval("sCountry") %>'>
                                                                                        <%# Eval("sCountry")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                     <asp:CheckBox ID="chkbActivate" runat="server" Checked='<%# Eval("btIsActive") %>' onchange="javascript:fnUpdateUserStatus(this);" />
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <img src="images/icon-view-edit.png" style="cursor: pointer" onclick="javascript:FillEditDialog(this);"
                                                                                        width="9" height="10" />&nbsp;
                                                                                    <img src="images/icon-delete.png" width="9" height="10" style="cursor: pointer" onclick="javascript:DeleteUsers(this);" />
                                                                                </td>
                                                                            </tr>
                                                                        </AlternatingItemTemplate>
                                                                    </asp:ListView>
                                                                    <tfoot class="paging">
                                                                        <tr>
                                                                            <td height="30" colspan="29">
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
                                <tr>
                                    <td height="15px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <div class="QTPopup" style="display: none">
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
                                                <span id="lblTitle">Add New Pharmasist</span>
                                            </div>
                                            <a href="#" class="closeBtn" title="Close"></a>
                                            <div class="content">
                                                <table width="100%" cellpadding="0" cellspacing="0">
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
                                                            Gender
                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                                                ControlToValidate="ddlCompanies" InitialValue="-1" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>--%>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:DropDownList ID="ddlGender" ClientIDMode="Static" runat="server" Style="border: 0px;
                                                                            background: none; margin-top: 4px; width: 245px; background-color: transparent;">
                                                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                                                            <asp:ListItem Value="Female">Female</asp:ListItem>
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
                                                                ControlToValidate="txtFirstName" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtFirstName" runat="server" value="" style="border: 0px;
                                                                            background: none; margin-top: 5px; width: 245px;" />
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
                                                            Last Name
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtLastName" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtLastName" runat="server" value="" style="border: 0px; background: none;
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
                                                                        <input type="text" id="txtEmail" runat="server" value="" style="border: 0px; background: none;
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
                                                            Username
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtUserName" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*"
                                                                ValidationExpression="^[0-9a-zA-Z]+$" ControlToValidate="txtUserName" ValidationGroup="grpValidateExpertDetials"
                                                                ToolTip="*Special Characters not allowed"></asp:RegularExpressionValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtUserName" runat="server" value="" style="border: 0px; background: none;
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
                                                            Password
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtPassword" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtPassword" runat="server" value="" style="border: 0px; background: none;
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
                                                            Address
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtAddress" runat="server" value="" style="border: 0px; background: none;
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
                                                            Post Code<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                ErrorMessage="*" InitialValue="-1" ControlToValidate="txtPostCode" ValidationGroup="grpValidateCompany"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:TextBox ID="txtPostCode" runat="server" onchange="javascript:fnLoadCountry();"
                                                                            value="" Style="border: 0px; background: none; margin-top: 5px; width: 245px;"></asp:TextBox>
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
                                                            Country
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:DropDownList ID="ddlCountry" Enabled="false" runat="server" value="" Style="border: 0px;
                                                                            background: none; margin-top: 5px; width: 245px;">
                                                                            <asp:ListItem Value="United States" Text="United States"></asp:ListItem>
                                                                            <asp:ListItem Value="Canada" Text="Canada"></asp:ListItem>
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
                                                            <asp:Button ID="btnSaveDetails" CssClass="default_button_3" runat="server" Text="Save" ValidationGroup="grpValidateExpertDetials"
                                                                CausesValidation="true" OnClientClick="UpdateValues(this); return false;" />
                                                            <input id="btnCancel" type="button" class="default_button_3" value="Cancel" onclick="javascript:CloseEditDialog();" />
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
        <tr>
            <td height="15px">
            </td>
        </tr>
    </table>
</asp:Content>
