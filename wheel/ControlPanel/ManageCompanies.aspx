<%@ page title="" language="C#" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_ManageCompanies, App_Web_zarixrtn" %>

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
        var idiCompanyID, idsTypeName, idiCompanyTypeID, idsAddress, idsCompanyName, idsEmail, idsPostcode, hfAdminCompanyID, hfUserID, idsCountry;

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
        function fnUpdateCompanyStatus(activeButton) {
            //            chkbActivate
            row = $(activeButton).parent().parent();
            idiCompanyID = $("#idiCompanyID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");

            //            alert("Changed, new value = " + activeButton.checked.toString());

            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnUpdateCompanyStatus",
                data: "{'iCompanyID':'" + idiCompanyID + "', 'sstatus':'" + activeButton.childNodes[0].checked.toString() + "'}",
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

        function DeleteCompany(deleteButton) {
            row = $(deleteButton).parent().parent();

            var agree = confirm("Are you sure you want to delete this record?");
            if (!agree)
                return false;

            idiCompanyID = $("#idiCompanyID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnDeleteCompany",
                data: "{'iCompanyID':'" + idiCompanyID + "'}",
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

        function FillEditDialog(editButton) {

            row = $(editButton).parent().parent();


            idiCompanyID = $("#idiCompanyID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsTypeName = $("#idsTypeName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiCompanyTypeID = $("#idiCompanyTypeID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsCompanyName = $("#idsCompanyName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsEmail = $("#idsEmail", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsPostcode = $("#idsPostcode", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsCountry = $("#idsCountry", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsAddress = $("#idsAddress", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            row.addClass("highlightRow");

            document.getElementById("lblTitle").innerHTML = "Edit Company";


            DisplayEditDialog();
            return false;
        }
        function DisplayEditDialog() {
            newEntry = "0";

            //            ddlCompanyTypes, txtCompanyName, txtEmail, txtAddress, txtPostCode
            //            idiCompanyID, idsTypeName, idiCompanyTypeID, idsCompanyName, idsEmail, idsPostcode, hfAdminCompanyID

            //            var desiredValue = idsTypeName;
            //            var el = document.getElementById("<%= ddlCompanyTypes.ClientID %>");
            //            for (var i = 0; i < el.options.length; i++) {
            //                if (el.options[i].text == desiredValue) {
            //                    el.selectedIndex = i;
            //                    break;
            //                }
            //            }


            var dropdownlistbox = document.getElementById("<%= ddlCompanyTypes.ClientID %>")

            for (var x = 0; x < dropdownlistbox.length; x++) {
                if (idiCompanyTypeID == dropdownlistbox.options[x].value) {
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

            //            $("#<%= ddlCompanyTypes.ClientID %> option:selected").val(idiCompanyTypeID)

            document.getElementById("<%= txtCompanyName.ClientID %>").value = idsCompanyName;
            document.getElementById("<%= txtEmail.ClientID %>").value = idsEmail;
            document.getElementById("<%= txtPostCode.ClientID %>").value = idsPostcode;
            document.getElementById("<%= txtAddress.ClientID %>").value = idsAddress;




            $(".QTPopup").animate({ width: 'show' }, 'slow');
        }


        function fnAddNewDialog() {
            newEntry = "1";
            idiCompanyID = 0;

            var el1 = document.getElementById("<%= ddlCompanyTypes.ClientID %>");
            el1.selectedIndex = 0;

            document.getElementById("<%= txtCompanyName.ClientID %>").value = "";
            document.getElementById("<%= txtPostCode.ClientID %>").value = "";
            document.getElementById("<%= txtEmail.ClientID %>").value = "";
            document.getElementById("<%= txtPostCode.ClientID %>").value = "";
            var el2 = document.getElementById("<%= ddlCountry.ClientID %>");
            el2.selectedIndex = 0;
            document.getElementById("<%= txtAddress.ClientID %>").value = "";
            document.getElementById("lblTitle").innerHTML = "Add New Company";

            $(".QTPopup").animate({ width: 'show' }, 'slow');

        }


        function UpdateValues(e) {
            idsTypeName = $("#<%= ddlCompanyTypes.ClientID %> option:selected").text();
            idiCompanyTypeID = $("#<%= ddlCompanyTypes.ClientID %> option:selected").val();

            if (idiCompanyTypeID.length < 1 || idiCompanyTypeID == -1) {
                alert("Please Select Company Type");
                return;
            }


            //var ctridiCompanyTypeID = $("#<%= ddlCompanyTypes.ClientID %> option:selected");
            var ctridsCompanyName = document.getElementById("<%= txtCompanyName.ClientID %>");
            var ctridsEmail = document.getElementById("<%= txtEmail.ClientID %>");

            //             if (ctridiCompanyTypeID.value.length < 1) 
            //             {
            //                 ctridiCompanyTypeID.focus();
            //                 alert('Please enter company type id');
            //                 return;
            //             }
            if (ctridsCompanyName.value.length < 1) {
                ctridsCompanyName.focus();
                alert('Please Enter company  Name');
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
            var el2 = document.getElementById("<%= ddlCountry.ClientID %>");
            idsCountry = el2.options[el2.selectedIndex].text;

            //            idsTypeName = $("#<%= ddlCompanyTypes.ClientID %> option:selected").text();
            //            idiCompanyTypeID = $("#<%= ddlCompanyTypes.ClientID %> option:selected").val();

            idsCompanyName = document.getElementById("<%= txtCompanyName.ClientID %>").value;
            idsEmail = document.getElementById("<%= txtEmail.ClientID %>").value;
            idsPostcode = document.getElementById("<%= txtPostCode.ClientID %>").value;
            idsAddress = document.getElementById("<%= txtAddress.ClientID %>").value;
            hfAdminCompanyID = document.getElementById("<%= hfAdminCompanyID.ClientID %>").value;
            hfUserID = document.getElementById("<%= hfUserID.ClientID %>").value;



            if (idiCompanyID == "")
                idiCompanyID = 0;


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnSaveCompany",
                //                int iCompanyID, int iCompanyTypeID,string sTypeName,string sCompanyName, string sEmail, string sAddress,string sPostcode, int iAdminCompanyID,int newEntry
                data: "{'iCompanyID':'" + idiCompanyID + "', 'iCompanyTypeID':'" + idiCompanyTypeID + "', 'sTypeName':'" + idsTypeName + "', 'sCompanyName':'" + idsCompanyName + "', 'sEmail':'" + idsEmail + "', 'sAddress':'" + idsAddress + "', 'sPostcode':'" + idsPostcode + "', 'iAdminCompanyID':'" + hfAdminCompanyID + "', 'newEntry':'" + newEntry + "', 'sUserID':'" + hfUserID + "', 'sCountry':'" + idsCountry + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == 1) {
                        $("#idsTypeName", row).text(idsTypeName);
                        $("#idsTypeName", row).attr("title", idsTypeName);
                        $("#idiCompanyTypeID", row).text(idiCompanyTypeID);
                        $("#idiCompanyID", row).text(idiCompanyID);

                        $("#idiCompanyTypeID", row).text(idiCompanyTypeID);
                        $("#idsCompanyName", row).text(idsCompanyName);
                        $("#idsCompanyName", row).attr("title", idsCompanyName);
                        $("#idsEmail", row).text(idsEmail);
                        $("#idsEmail", row).attr("title", idsEmail);
                        $("#idsPostcode", row).text(idsPostcode);
                        $("#idsPostcode", row).attr("title", idsPostcode);
                        $("#idsCountry", row).text(idsCountry);
                        $("#idsCountry", row).attr("title", idsCountry);
                        $("#idsAddress", row).text(idsAddress);
                        $("#idsAddress", row).attr("title", idsAddress);

                        CloseEditDialog();



                        if (newEntry == 1)
                            __doPostBack('__Page', '');


                    }
                    else if (result == 2) {

                        var lblMessage = document.getElementById("<%= lblMessage.ClientID %>");
                        lblMessage.innerHTML = "Company already exists, Please Select  Different";
                        lblMessage.style.color = "#861012";
                        lblMessage.style.display = "block";

                        //                        alert('Company Type already exists, Please Select  Different');
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
            <td height="15px">
            </td>
        </tr>
        <tr>
            <td class="mainbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="5" height="5">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mainboxheading">
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="6" height="5">
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
                                                                                        Companies
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
                                                                        <td width="6" height="5">
                                                                            <td>
                                                                            </td>
                                                                            <td>
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
                                                <%-- <td height="3px">--%>
                                                <td height="5" align="right">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td width="5">
                                                                &nbsp;
                                                            </td>
                                                            <td width="95" align="right">
                                                                &nbsp;
                                                            </td>
                                                            <td width="5">
                                                                &nbsp;
                                                            </td>
                                                            <td width="94">
                                                                <input id="Button2" type="button" class="gbtn_s" style="background: url(images/btn-addnew.png);
                                                                    width: 94px; height: 33px" onclick="javascript:fnAddNewDialog();" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="5px">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grid">
                                        <asp:ListView ID="lstCompanies" runat="server">
                                            <LayoutTemplate>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <%--      <td width="232" align="left" class="grid-header">
                                                Company Id
                                            </td>--%>
                                                        <td height="30" width="5" class="grid-header">
                                                        </td>
                                                        <td width="262" align="left" class="grid-header">
                                                            Company Name
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="200" align="left" class="grid-header">
                                                            Company Type
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="200" align="left" class="grid-header">
                                                            Email
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="103" align="left" class="grid-header">
                                                            PostCode
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="103" align="left" class="grid-header">
                                                            Country
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="103" align="left" class="grid-header">
                                                            Status
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="61" align="center" class="grid-header">
                                                            Action
                                                        </td>
                                                    </tr>
                                                    <tr id="ItemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td height="30" class="grid-bg-color grid-border-bottom">
                                                        <span id="idiCompanyID" title='<%# Eval("iCompanyID") %>' style="display: none">
                                                            <%# Eval("iCompanyID")%></span>
                                                    </td>
                                                    <td align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsCompanyName" title='<%# Eval("sCompanyName") %>'>
                                                            <%# Eval("sCompanyName")%></span>
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsTypeName" title='<%# Eval("sTypeName") %>'>
                                                            <%# Eval("sTypeName")%></span> <span id="idiCompanyTypeID" style="display: none;">
                                                                <%# Eval("iCompanyTypeID")%></span>
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsEmail" title='<%# Eval("sEmail") %>'>
                                                            <%# Eval("sEmail")%></span> <span id="idsAddress" style="display: none">
                                                                <%# Eval("sAddress")%></span>
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsPostcode" title='<%# Eval("sPostcode") %>'>
                                                            <%# Eval("sPostcode")%></span>
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsCountry" title='<%# Eval("sCountry") %>'>
                                                            <%# Eval("sCountry")%></span>
                                                    </td>
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-bg-color grid-border-bottom">
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("btIsActive") %>' onchange="javascript:fnUpdateCompanyStatus(this);" />
                                                        <%--<input id="chkbActivate" type="checkbox" checked='<%# Eval("btIsActive") %>' onchange="javascript:fnUpdateCompanyStatus(this);" />--%>
                                                        <td class="grid-bg-color grid-border-bottom">
                                                        </td>
                                                        <td bgcolor="#CCCCCC">
                                                        </td>
                                                        <td class="grid-bg-color grid-border-bottom">
                                                        </td>
                                                        <td align="center" class="grid-bg-color grid-border-bottom">
                                                            <img src="images/icon-view-edit.png" style="cursor: pointer" onclick="javascript:FillEditDialog(this);"
                                                                width="9" height="10" />&nbsp;
                                                            <img src="images/icon-delete.png" width="9" height="10" style="cursor: pointer" onclick="javascript:DeleteCompany(this);" />
                                                        </td>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <AlternatingItemTemplate>
                                                <tr>
                                                    <%-- <td width="232" align="left" class="grid-border-bottom">
                                            <span id="idiCompanyID" title='<%# Eval("iCompanyID") %>'>
                                                <%# Eval("iCompanyID")%></span>
                                        </td>--%>
                                                    <td height="30px" class="grid-border-bottom">
                                                        <span id="idiCompanyID" title='<%# Eval("iCompanyID") %>' style="display: none">
                                                            <%# Eval("iCompanyID")%></span>
                                                    </td>
                                                    <td align="left" class="grid-border-bottom">
                                                        <span id="idsCompanyName" title='<%# Eval("sCompanyName") %>'>
                                                            <%# Eval("sCompanyName")%></span>
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-border-bottom">
                                                        <span id="idsTypeName" title='<%# Eval("sTypeName") %>'>
                                                            <%# Eval("sTypeName")%></span> <span id="idiCompanyTypeID" style="display: none;">
                                                                <%# Eval("iCompanyTypeID")%></span>
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-border-bottom">
                                                        <span id="idsEmail" title='<%# Eval("sEmail") %>'>
                                                            <%# Eval("sEmail")%></span> <span id="idsAddress" style="display: none">
                                                                <%# Eval("sAddress")%></span>
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-border-bottom">
                                                        <span id="idsPostcode" title='<%# Eval("sPostcode") %>'>
                                                            <%# Eval("sPostcode")%></span>
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-border-bottom">
                                                        <span id="idsCountry" title='<%# Eval("sCountry") %>'>
                                                            <%# Eval("sCountry")%></span>
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td align="left" class="grid-border-bottom">
                                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("btIsActive") %>' onchange="javascript:fnUpdateCompanyStatus(this);" />
                                                       <%-- <input id="chkbActivate" type="checkbox" checked='<%# Eval("btIsActive") %>' onchange="javascript:fnUpdateCompanyStatus(this);" />--%>
                                                    </td>
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td bgcolor="#CCCCCC">
                                                    </td>
                                                    <td class="grid-border-bottom">
                                                    </td>
                                                    <td align="center" class="grid-border-bottom">
                                                        <img src="images/icon-view-edit.png" style="cursor: pointer" onclick="javascript:FillEditDialog(this);"
                                                            width="9" height="10" />&nbsp;
                                                        <img src="images/icon-delete.png" width="9" height="10" style="cursor: pointer" onclick="javascript:DeleteCompany(this);" />
                                                    </td>
                                                </tr>
                                            </AlternatingItemTemplate>
                                        </asp:ListView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="paging">
                                            <tr>
                                                <td height="30" colspan="30">
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
                                                                <asp:DataPager ID="dtpCompanies" Visible="true" PageSize="20" runat="server" PagedControlID="lstCompanies"
                                                                    OnPreRender="dtpCompanies_PreRender">
                                                                    <Fields>
                                                                        <asp:NextPreviousPagerField ButtonCssClass="grid_pagi_bg_a1" FirstPageText="First"
                                                                            NextPageText="" PreviousPageText="« Previous" />
                                                                        <asp:NumericPagerField NumericButtonCssClass="grid_pagi_bg_a2" />
                                                                        <asp:NextPreviousPagerField ButtonCssClass="grid_pagi_bg_a1" LastPageText="Last"
                                                                            NextPageText="Next »" PreviousPageText="" />
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
                                        </table>
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
            <td>
                <table width="968" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top">
                            <asp:HiddenField ID="hfAdminCompanyID" runat="server" />
                            <asp:HiddenField ID="hfUserID" runat="server" />
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
                                                <span id="lblTitle">Add New Company</span>
                                            </div>
                                            <a href="#" class="closeBtn" title="Close"></a>
                                            <div class="content">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            Company Type<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                ErrorMessage="*" InitialValue="-1" ControlToValidate="ddlCompanyTypes" ValidationGroup="grpValidateCompany"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:DropDownList ID="ddlCompanyTypes" ClientIDMode="Static" runat="server" Style="border: 0px;
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
                                                            Company Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                                ErrorMessage="*" ControlToValidate="txtCompanyName" ValidationGroup="grpValidateCompany"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtCompanyName" runat="server" value="" style="border: 0px;
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
                                                            Email<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                ErrorMessage="*" ControlToValidate="txtEmail" ValidationGroup="grpValidateCompany"
                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtEmail" ValidationGroup="grpValidateCompany"></asp:RequiredFieldValidator>
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
                                                            Address
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:TextBox ID="txtAddress" ClientIDMode="Static" runat="server" Style="border: 0px;
                                                                            background: none; margin-top: 5px; width: 245px;"></asp:TextBox>
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
                                                            Post Code<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
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
                                                            <asp:Button ID="btnSaveDetails" CssClass="default_button_3" runat="server" Text="Save"
                                                                ValidationGroup="grpValidateCompany" CausesValidation="true" OnClientClick="UpdateValues(); return false;" />
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
                    <tr>
                        <td height="15px">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
