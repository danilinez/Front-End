<%@ page title="" language="C#" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_PharmacistLocations, App_Web_zarixrtn" %>

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
        var idiVenueID, idiContactID, idsDoctorName, idsPostcode, idsAddress, sLocationName, hfAdminCompanyID, idsPhone, idsMobile, idsCountry;

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
        function DeleteLinkedVenues(deleteButton) {
            row = $(deleteButton).parent().parent();

            var agree = confirm("Are you sure you want to delete this record?");
            if (!agree)
                return false;

            idiVenueID = $("#idiVenueID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnDeleteLinkedVenues",
                data: "{'iVenueID':'" + idiVenueID + "'}",
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

        function FillEditDialog(editButton) {

            row = $(editButton).parent().parent();

            idiVenueID = $("#idiVenueID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsDoctorName = $("#idsDoctorName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiContactID = $("#idiContactID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsPostcode = $("#idsPostcode", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsLocationName = $("#idsLocationName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsAddress = $("#idsAddress", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsCountry = $("#idsCountry", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsPhone = $("#idsPhone", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsMobile = $("#idsMobile", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");

            row.addClass("highlightRow");
            document.getElementById("lblTitle").innerHTML = "Edit Pharmacist Location";


            DisplayEditDialog();
            return false;
        }
        function DisplayEditDialog() {
            newEntry = "0";

            //            idiVenueID = 0;
            var dropdownlistbox = document.getElementById("<%= ddlExpertName.ClientID %>")

            for (var x = 0; x < dropdownlistbox.length; x++) {
                if (idiContactID == dropdownlistbox.options[x].value) {
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

            document.getElementById("<%= txtPostCode.ClientID %>").value = idsPostcode;
            document.getElementById("<%= txtlocationname.ClientID %>").value = idsLocationName;
            document.getElementById("<%= txtAddress.ClientID %>").value = idsAddress;
            document.getElementById("<%= txtPhone.ClientID %>").value = idsPhone;
            document.getElementById("<%= txtMobile.ClientID %>").value = idsMobile;

            $(".QTPopup").animate({ width: 'show' }, 'slow');
        }

        function fnAddNewDialog() {
            newEntry = "1";

            idiVenueID = 0;
            var desiredValue = idsDoctorName;
            var el = document.getElementById("ddlExpertName");
            el.selectedIndex = 0;
            var el2 = document.getElementById("<%= ddlCountry.ClientID %>");
            el2.selectedIndex = 0;
            document.getElementById("<%= txtPostCode.ClientID %>").value = "";

            document.getElementById("<%= txtlocationname.ClientID %>").value = "";
            document.getElementById("<%= txtAddress.ClientID %>").value = "";
            document.getElementById("<%= txtPhone.ClientID %>").value = ""
            document.getElementById("<%= txtMobile.ClientID %>").value = "";
            document.getElementById("lblTitle").innerHTML = "Add New Linked Venues ";

            $(".QTPopup").animate({ width: 'show' }, 'slow');

        }

        function UpdateValues(e) {

            var el = document.getElementById("<%= ddlExpertName.ClientID %>");
            idsDoctorName = el.options[el.selectedIndex].text;
            idiContactID = el.options[el.selectedIndex].value;

            if (idiContactID.length < 1 || idiContactID == -1) {
                alert("Please Select Pharmacist");
                return;
            }

            var ctridsPostcode = document.getElementById("<%= txtPostCode.ClientID %>");
            var ctridsAddress = document.getElementById("<%= txtAddress.ClientID %>");
            var ctridsLocationName = document.getElementById("<%= txtlocationname.ClientID %>");

            if (ctridsLocationName.value.length < 1) {
                ctridsLocationName.focus();
                alert('Please Enter Location Name');
                return;
            }


            if (ctridsAddress.value.length < 1) {
                ctridsAddress.focus();
                alert('Please Enter Your Address');
                return;
            }

            if (ctridsPostcode.value.length < 1) {
                ctridsPostcode.focus();
                alert('Please Enter PostCode');
                return;
            }


            var el2 = document.getElementById("<%= ddlCountry.ClientID %>");
            idsCountry = el2.options[el2.selectedIndex].text;

            idsPostcode = document.getElementById("<%= txtPostCode.ClientID %>").value;

            idsPostcode = idsPostcode.replace(/\s/g, '');

            idsAddress = document.getElementById("<%= txtAddress.ClientID %>").value;
            idsLocationName = document.getElementById("<%= txtlocationname.ClientID %>").value;
            idsMobile = document.getElementById("<%= txtMobile.ClientID %>").value;
            idsPhone = document.getElementById("<%= txtPhone.ClientID %>").value;
            hfAdminCompanyID = document.getElementById("<%= hfAdminCompanyID.ClientID %>").value;

            if (idiVenueID == "")
                idiVenueID = 0;
            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnSaveLinkedVenue",
                data: "{'iVenueID':'" + idiVenueID + "','iContactID':'" + idiContactID + "','sPostCode':'" + idsPostcode + "','sAddress':'" + idsAddress + "','sLocationName':'" + idsLocationName + "','iUserTypeID':'3','sPhoneNumber':'" + idsPhone.toString() + "','sMobile':'" + idsMobile.toString() + "', 'newEntry':'" + newEntry + "','iAdminCompanyID':'" + hfAdminCompanyID + "', 'sCountry':'" + idsCountry + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == 1) {
                        if (idiVenueID > 0) {

                            $("#idsDoctorName", row).text(idsDoctorName);
                            $("#idsDoctorName", row).attr("title", idsDoctorName);
                            $("#idiContactID", row).text(idiContactID);

                            $("#idsLocationName", row).text(idsLocationName);
                            $("#idsLocationName", row).attr("title", idsLocationName);

                            $("#idsPostcode", row).text(idsPostcode);
                            $("#idsPostcode", row).attr("title", idsPostcode);
                            $("#idsAddress", row).text(idsAddress);
                            $("#idsAddress", row).attr("title", idsAddress);

                            $("#idsPhone", row).text(idsPhone);
                            $("#idsPhone", row).attr("title", idsPhone);

                            $("#idsMobile", row).text(idsMobile);
                            $("#idsMobile", row).attr("title", idsMobile);


                            $("#idsCountry", row).text(idsCountry);
                            $("#idsCountry", row).attr("title", idsCountry);
                        }
                        CloseEditDialog();

                        if (newEntry == 1)
                            __doPostBack('__Page', '');


                    }
                    else if (result == 2) {

                        var lblMessage = document.getElementById("<%= lblMessage.ClientID %>");
                        lblMessage.innerHTML = "Venues Link already exists, Please Select  Different";
                        lblMessage.style.color = "#861012";
                        lblMessage.style.display = "block";

                    }
                    else if (result == 3) {
                        alert('Invalid ZipCode/PostCode');
                    }
                    else if (result == 0) {
                        alert('There is some propblem in Saving records');
                    }
                },
                failure: function (msg) {
                    alert(msg);
                }
            });
            return false;

        }



        function CloseEditDialog() {
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
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            &nbsp;<asp:HiddenField ID="idiVenueID" runat="server" />
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
                                                                                                    Pharmacist Locations
                                                                                                </td>
                                                                                                <td width="15">
                                                                                                    <img src="images/bullet-heading-right.png" alt="" width="15" height="16" />
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
                                                            <td height="5" align="right">
                                                                <input id="Button2" type="button" class="gbtn_s" style="background: url(images/btn-addnew.png);
                                                                    width: 94px; height: 33px" onclick="javascript:fnAddNewDialog();" />
                                                            </td>
                                                        </tr>
                                                           <tr>
                                                            <td height="3px" >
                                                                 </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                    <thead>
                                                                        <tr>
                                                                            <td style="width: 100px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                Venue ID
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Expert Name
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Location Name
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 150px" class="grid-header">
                                                                                Address
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 50px" class="grid-header">
                                                                                Post Code
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Country
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 80px" class="grid-header">
                                                                                Phone
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
                                                                    <asp:ListView ID="lstLinkedVenue" runat="server">
                                                                        <LayoutTemplate>
                                                                            <tbody>
                                                                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                            </tbody>
                                                                        </LayoutTemplate>
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idiVenueID" title='<%# Eval("iVenueID") %>'>
                                                                                        <%# Eval("iVenueID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <%--<span id="idsDoctorName" style="display: none;" title='<%# Eval("sName") %>'>
                                                                                        <%# Eval("sName")%></span>--%>
                                                                                    <span id="idiContactID" style="display: none;">
                                                                                        <%# Eval("iContactID")%></span> <span id="idsDoctorName" title='<%# Eval("sName") %>'>
                                                                                            <%# Eval("sName")%>
                                                                                        </span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsLocationName" title='<%# Eval("sLocationName") %>'>
                                                                                        <%# Eval("sLocationName")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsAddress" title='<%# Eval("sAddress") %>'>
                                                                                        <%# Eval("sAddress")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsPostcode" title='<%# Eval("sPostCode") %>'>
                                                                                        <%# Eval("sPostCode")%></span>
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
                                                                                    <span id="idsPhone" title='<%# Eval("sPhoneNumber") %>'>
                                                                                        <%# Eval("sPhoneNumber")%></span> <span id="idsMobile" title='<%# Eval("sMobile") %>'
                                                                                            style="display: none;">
                                                                                            <%# Eval("sMobile")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <img src="images/icon-view-edit.png" alt="Edit page" style="cursor: pointer" onclick="javascript:FillEditDialog(this);"
                                                                                        width="9" height="10" />&nbsp;
                                                                                    <img src="images/icon-delete.png" alt="delete page" width="9" height="10" style="cursor: pointer"
                                                                                        onclick="javascript:DeleteLinkedVenues(this);" />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <AlternatingItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idiVenueID" title='<%# Eval("iVenueID") %>'>
                                                                                        <%# Eval("iVenueID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idiContactID" style="display: none;">
                                                                                        <%# Eval("iContactID")%></span> <span id="idsDoctorName" title='<%# Eval("sName") %>'>
                                                                                            <%# Eval("sName")%>
                                                                                        </span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsLocationName" title='<%# Eval("sLocationName") %>'>
                                                                                        <%# Eval("sLocationName")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsAddress" title='<%# Eval("sAddress") %>'>
                                                                                        <%# Eval("sAddress")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsPostcode" title='<%# Eval("sPostcode") %>'>
                                                                                        <%# Eval("sPostcode")%></span>
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
                                                                                    <span id="idsPhone" title='<%# Eval("sPhoneNumber") %>'>
                                                                                        <%# Eval("sPhoneNumber")%></span> <span id="idsMobile" title='<%# Eval("sMobile") %>'
                                                                                            style="display: none;">
                                                                                            <%# Eval("sMobile")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <img src="images/icon-view-edit.png" alt="Edit Page" style="cursor: pointer" onclick="javascript:FillEditDialog(this);"
                                                                                        width="9" height="10" />&nbsp;
                                                                                    <img src="images/icon-delete.png" alt="Delete Page" width="9" height="10" style="cursor: pointer"
                                                                                        onclick="javascript:DeleteLinkedVenues(this);" />
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
                                                                                            <asp:DataPager ID="dtpLinkedVenue" Visible="true" PageSize="25" runat="server" PagedControlID="lstLinkedVenue"
                                                                                                OnPreRender="dtpLinkedVenue_PreRender">
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
                                                <span id="lblTitle">Add Pharmacist Location </span>
                                            </div>
                                            <a href="#" class="closeBtn" title="Close"></a>
                                            <div class="content">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Pharmacist<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                ErrorMessage="*" InitialValue="-1" ControlToValidate="ddlExpertName" ValidationGroup="grpValidateCompany"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:DropDownList ID="ddlExpertName" ClientIDMode="Static" runat="server" Style="border: 0px;
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
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Location Name
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                                                InitialValue="-1" ControlToValidate="txtlocationname" ValidationGroup="grpValidateCompany"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:TextBox ID="txtlocationname" runat="server" value="" Style="border: 0px; background: none;
                                                                            margin-top: 5px; width: 245px;"></asp:TextBox>
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
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                                                InitialValue="-1" ControlToValidate="txtAddress" ValidationGroup="grpValidateCompany"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:TextBox ID="txtAddress" runat="server" value="" Style="border: 0px; background: none;
                                                                            margin-top: 5px; width: 245px;"></asp:TextBox>
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
                                                            Post Code<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
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
                                                            Phone
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:TextBox ID="txtPhone" runat="server" value="" Style="border: 0px; background: none;
                                                                            margin-top: 5px; width: 245px;"></asp:TextBox>
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
                                                            Mobile
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:TextBox ID="txtMobile" runat="server" value="" Style="border: 0px; background: none;
                                                                            margin-top: 5px; width: 245px;"></asp:TextBox>
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
                                                            <asp:Button ID="btnSaveDetails" CssClass="default_button_3" runat="server" Text="Save" ValidationGroup="grpValidateCompanyType"
                                                                CausesValidation="true" OnClientClick="UpdateValues(); return false;" />
                                                            <asp:Button ID="btnCancel" CssClass="default_button_3" runat="server" Text="Cancel" OnClientClick="CloseEditDialog();" />
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
