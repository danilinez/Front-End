<%@ page title="" language="C#" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_Partner, App_Web_zarixrtn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="popupscript/jquery.js" type="text/javascript"></script>
    <link href="css/popupCSS.css" rel="stylesheet" type="text/css" />
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


        var idiPartnerID, idsPartnerName, idsTitle, idsPartnerDescription, idsImageLink, idsLocation, idsEmail, idsWebsite;

        var validFilesTypes = ["bmp", "gif", "png", "jpg", "jpeg"];
        function ValidateFile() {
            var file = document.getElementById("<%=FileUpload1.ClientID%>");
            var label = document.getElementById("<%=Label1.ClientID%>");
            var path = file.value;
            var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
            var isValidFile = false;
            for (var i = 0; i < validFilesTypes.length; i++) {
                if (ext == validFilesTypes[i]) {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile) {
                label.style.color = "red";
                label.innerHTML = "Invalid File. Please upload a File with" +
         " extension:\n\n" + validFilesTypes.join(", ");
            }
            return isValidFile;
        }

        function fnUpdatePartnerStatus(activeButton) {
            //            chkbActivate
            row = $(activeButton).parent().parent();

            idiPartnerID = $("#idiPartnerID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnUpdatePartnerStatus",
                data: "{'iPartnerID':'" + idiPartnerID + "','sstatus':'" + activeButton.checked.toString() + "'}",
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


        function DeletePartner(deleteButton) {
            row = $(deleteButton).parent().parent();

            var agree = confirm("Are you sure you want to delete this record?");
            if (!agree)
                return false;

            idiPartnerID = $("#idiPartnerID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");



            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnDeletePartner",
                data: "{'iPartnerID':'" + idiPartnerID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == "1") {
                        __doPostBack('__Page', '');
                    }
                    else if (result == "2") {

                        alert('Can not delete record, already in use!');
                    }


                    else if (result == "0") {
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

            idiPartnerID = $("#idiPartnerID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsPartnerName = $("#idsPartnerName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsPartnerDescription = $("#idsPartnerDescription", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsImageLink = $("#idsImageLink", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsLocation = $("#idsLocation", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");

            idsEmail = $("#idsEmail", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsWebsite = $("#idsWebsite", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");

            row.addClass("highlightRow");

            document.getElementById("lblTitle").innerHTML = "Edit Partner";


            DisplayEditDialog();
            return false;
        }
        function DisplayEditDialog() {
            newEntry = "0";
            document.getElementById("<%= txtPartnerName.ClientID %>").value = idsPartnerName;

            document.getElementById("<%= txtPartnerDescription.ClientID %>").value = idsPartnerDescription;
            document.getElementById("<%= txtsLocation.ClientID %>").value = idsLocation;
            document.getElementById("<%= txtEmail.ClientID %>").value = idsEmail;
            document.getElementById("<%= txtWebsite.ClientID %>").value = idsWebsite;



            $(".QTPopup").animate({ width: 'show' }, 'slow');
        }

        function fnAddNewDialog() {

            newEntry = "1";
            idiPartnerID = "0";

            document.getElementById("<%= txtPartnerName.ClientID %>").value = "";

            document.getElementById("<%= txtPartnerDescription.ClientID %>").value = "";
            document.getElementById("<%= txtsLocation.ClientID %>").value = "";
            document.getElementById("<%= txtEmail.ClientID %>").value = "";
            document.getElementById("<%= txtWebsite.ClientID %>").value = "";

            document.getElementById("lblTitle").innerHTML = "Add New Banner";
            $(".QTPopup").animate({ width: 'show' }, 'slow');

        }

        var numericExpression = /^[0-9]+$/;
        function UpdateValues(e) {


            var ctridsPartnerName = document.getElementById("<%= txtPartnerName.ClientID %>");
            var ctridsPartnerDescription = document.getElementById("<%= txtPartnerDescription.ClientID %>");
            var ctridsLocation = document.getElementById("<%= txtsLocation.ClientID %>");

            var ctridsEmail = document.getElementById("<%= txtEmail.ClientID %>");
            var ctridWebsite = document.getElementById("<%= txtWebsite.ClientID %>");


            if (ctridsPartnerName.value.length < 1) {
                ctridsPartnerName.focus();
                alert('Please Enter Partner  Name');
                return;
            }



            if (ctridsPartnerDescription.value.length < 1) {
                ctridsPartnerDescription.focus();
                alert('Please Enter Partner Description')
                return;
            }

            if (ctridsLocation.value.length < 1) {
                ctridsLocation.focus();
                alert('Please Enter Location')
                return;
            }

            if (ctridsEmail.value.length < 1) {
                ctridsEmail.focus();
                alert('Please Enter Email Address');
                return;
            }
            if (ctridWebsite.value.length < 1) {
                ctridWebsite.focus();
                alert('Please Enter Website Link');
                return;
            }

            if (!ValidateFile()) {
                return;
            }


            idsPartnerName = document.getElementById("<%= txtPartnerName.ClientID %>").value;

            idsPartnerDescription = document.getElementById("<%= txtPartnerDescription.ClientID %>").value;
            idsLocation = document.getElementById("<%= txtsLocation.ClientID %>").value;
            idsEmail = document.getElementById("<%= txtEmail.ClientID %>").value;
            idsWebsite = document.getElementById("<%= txtWebsite.ClientID %>").value;
            var path = document.getElementById("<%= FileUpload1.ClientID %>").value;
            var pos = path.lastIndexOf(path.charAt(path.indexOf(":") + 1));
            idsImageLink = path.substring(pos);
            idsImageLink = idsImageLink.replace("\\", "");


            if (idiPartnerID == "")
                idiPartnerID = 0;

            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnSavePartner",
                data: "{'iPartnerID':'" + idiPartnerID + "','sPartnerName':'" + idsPartnerName + "', 'sDescription':'" + idsPartnerDescription + "', 'sImagePath':'" + idsImageLink + "', 'sEmail':'" + idsEmail + "', 'sWebsite':'" + idsWebsite + "', 'sLocation':'" + idsLocation + "' ,'newEntry':'" + newEntry + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == 1) {
                        if (idiPartnerID > 0) {
                            $("#idiPartnerID", row).text(idiPartnerID);
                            $("#idsPartnerName", row).text(idsPartnerName);
                            $("#idsPartnerDescription", row).text(idsPartnerDescription);
                            $("#idsImageLink", row).text(idsImageLink);
                            $("#idsLocation", row).text(idsLocation);
                            $("#idsEmail", row).text(idsEmail);
                            $("#idsWebsite", row).text(idsWebsite);



                        }
                        CloseEditDialog();

                        if (newEntry == 1)
                            $("#btnCallUpload").click();

                        else if (newEntry == 0)
                            $("#btnCallUpload").click();



                        else return;

                    }
                    if (result == 3)
                    { alert("This Sorting ID is Already Given") }

                    else if (result == 2) {

                        var lblMessage = document.getElementById("<%= lblMessage.ClientID %>");
                        lblMessage.innerHTML = "Partner already exists, Please Select  Different";
                        lblMessage.style.color = "#861012";
                        lblMessage.style.display = "block";
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
            //            row.removeClass("highlightRow");
            $(".QTPopup").css('display', 'none');
        }
        function btnSaveDetails_onclick() {

        }

        function btnCancel_onclick() {

        }

    </script>
    <table width="968" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="968" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top">
                            &nbsp;
                            <asp:Button ID="btnCallUpload" ClientIDMode="Static" Style="display: none;" runat="server"
                                Text="Button" OnClick="btnCallUpload_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="5" height="5px">
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
                                                                                                    Partners
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
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                    <thead>
                                                                        <tr>
                                                                            <td style="width: 100px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                Partner ID
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Partner Name
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Description
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Logo
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Status
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
                                                                    <asp:ListView ID="lstPartner" runat="server">
                                                                        <LayoutTemplate>
                                                                            <tbody>
                                                                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                            </tbody>
                                                                        </LayoutTemplate>
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idiPartnerID" title='<%# Eval("iPartnerID") %>'>
                                                                                        <%# Eval("iPartnerID")%></span> <span id="idsLocation" style="display: none" title='<%# Eval("sLocation") %>'>
                                                                                            <%# Eval("sLocation")%></span> <span id="idsEmail" style="display: none" title='<%# Eval("sEmail") %>'>
                                                                                                <%# Eval("sEmail")%></span> <span id="idsWebsite" style="display: none" title='<%# Eval("sWebsite") %>'>
                                                                                                    <%# Eval("sWebsite")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsPartnerName" title='<%# Eval("sPartnerName") %>'>
                                                                                        <%# Eval("sPartnerName")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsPartnerDescription" title='<%# Eval("sPartnerDescription") %>'>
                                                                                        <%# Eval("sPartnerDescription").ToString().Length > 20 ? Eval("sPartnerDescription").ToString().Substring(0, 19) : Eval("sPartnerDescription").ToString()%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsImageLink" style="display: none" title='<%# Eval("sImageLink") %>'>
                                                                                        <%# Eval("sImageLink")%></span>
                                                                                    <img alt="" src='../UploadedFiles/<%# Eval("sImageLink")%>' width="25" height="25" />
                                                                                    </span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idbtIsActive" style="display: none" title='<%# Eval("btIsActive") %>'>
                                                                                        <%# Eval("btIsActive")%></span>
                                                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("btIsActive")%>' onclick="javascript:fnUpdatePartnerStatus(this);" />
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <img src="images/icon-view-edit.png" alt="edit" style="cursor: pointer" onclick="javascript:FillEditDialog(this);"
                                                                                        width="9" height="10" />&nbsp;
                                                                                    <img src="images/icon-delete.png" width="9" alt="delete" height="10" style="cursor: pointer"
                                                                                        onclick="javascript:DeletePartner(this);" />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <AlternatingItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idiPartnerID" title='<%# Eval("iPartnerID") %>'>
                                                                                        <%# Eval("iPartnerID")%></span> <span id="idsLocation" style="display: none" title='<%# Eval("sLocation") %>'>
                                                                                            <%# Eval("sLocation")%></span> <span id="idsEmail" style="display: none" title='<%# Eval("sEmail") %>'>
                                                                                                <%# Eval("sEmail")%></span> <span id="idsWebsite" style="display: none" title='<%# Eval("sWebsite") %>'>
                                                                                                    <%# Eval("sWebsite")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsPartnerName" title='<%# Eval("sPartnerName") %>'>
                                                                                        <%# Eval("sPartnerName")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsPartnerDescription" title='<%# Eval("sPartnerDescription") %>'>
                                                                                        <%# Eval("sPartnerDescription").ToString().Length > 20 ? Eval("sPartnerDescription").ToString().Substring(0, 19) : Eval("sPartnerDescription").ToString()%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsImageLink" style="display: none" title='<%# Eval("sImageLink") %>'>
                                                                                        <%# Eval("sImageLink")%></span>
                                                                                    <img alt="" src='../UploadedFiles/<%# Eval("sImageLink")%>' width="25" height="25" />
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idbtIsActive" style="display: none" title='<%# Eval("btIsActive") %>'>
                                                                                        <%# Eval("btIsActive")%></span>
                                                                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("btIsActive")%>' onclick="javascript:fnUpdatePartnerStatus(this);" />
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
                                                                                    <img src="images/icon-delete.png" width="9" height="10" style="cursor: pointer" onclick="javascript:DeletePartner(this);" />
                                                                                </td>
                                                                            </tr>
                                                                        </AlternatingItemTemplate>
                                                                    </asp:ListView>
                                                                    <tfoot class="paging">
                                                                        <tr>
                                                                            <td height="30" colspan="21">
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
                                                                                            <asp:DataPager ID="dtpPartner" Visible="true" PageSize="10" runat="server" PagedControlID="lstPartner"
                                                                                                OnPreRender="dtpPartner_PreRender">
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
                                <%--style="display: none" --%>
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
                                                <span id="lblTitle">Add New Partner</span>
                                            </div>
                                            <a href="#" class="closeBtn" title="Close"></a>
                                            <div class="content">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            Partner&nbsp; Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                                ErrorMessage="*" SetFocusOnError="true" ValidationGroup="validateProduct" ControlToValidate="txtPartnerName"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtPartnerName" runat="server" value="" style="border: 0px;
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
                                                            Description
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                                                SetFocusOnError="true" ValidationGroup="validateProduct" ControlToValidate="txtPartnerDescription"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtPartnerDescription" runat="server" value="" style="border: 0px;
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
                                                            Address
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                                                SetFocusOnError="true" ValidationGroup="validateProduct" ControlToValidate="txtsLocation"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtsLocation" runat="server" value="" style="border: 0px;
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
                                                            Email
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                                                SetFocusOnError="true" ValidationGroup="validateProduct" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
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
                                                            Website Link
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                                                SetFocusOnError="true" ValidationGroup="validateProduct" ControlToValidate="txtsLocation"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtWebsite" runat="server" value="" style="border: 0px; background: none;
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
                                                            Partner Logo<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF|.jpeg|JPEG)$" ErrorMessage="*"
                                                                ControlToValidate="FileUpload1" ValidationGroup="validateProduct"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                                                                SetFocusOnError="true" ValidationGroup="validateProduct" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                            <asp:Label ID="Label1" runat="server" Text="."></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input id="btnSaveDetails" type="button" class="default_button_3" value="Save" onclick="javascript:UpdateValues();"
                                                                validationgroup="vendorValidation" causesvalidation="true" onclick="return btnSaveDetails_onclick()" />
                                                            <input id="btnCancel" type="button" class="default_button_3" value="Cancel" onclick="javascript:CloseEditDialog();"
                                                                onclick="return btnCancel_onclick()" />
                                                            <%--  <asp:Button ID="btnSaveDetails" CssClass="default_button_3" runat="server" Text="Save"
                                                                ValidationGroup="validateProduct" CausesValidation="true" OnClientClick="UpdateValues(); "
                                                                OnClick="btnSaveDetails_Click" />
                                                            <asp:Button ID="btnCancel" CssClass="default_button_3" CausesValidation="false" runat="server"
                                                                Text="Cancel" OnClientClick="CloseEditDialog();" />--%>
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
