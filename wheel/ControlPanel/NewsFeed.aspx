<%@ page title="" language="C#" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_NewsFeed, App_Web_zarixrtn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
        var idiNewsID, idsNewsTitle, idsNewsDescription, iddtPostingDate, idiAdminCompanyID, idiUserID, idIuserTypeID, idsImage;
        // [iNewsID], [sNewsTitle], [sNewsDescription], [dtPostingDate] , [dtCreatedDate] , [iAdminCompanyID] , [iUserID] , [IuserTypeID]


        function DeleteUsers(deleteButton) {
            row = $(deleteButton).parent().parent();

            var agree = confirm("Are you sure you want to delete this record?");
            if (!agree)
                return false;

            idiNewsID = $("#idiNewsID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnDeleteNewsFeeds",
                data: "{'iNewsID':'" + idiNewsID + "'}",
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
            //idiNewsID, idsNewsTitle, idsNewsDescription, iddtPostingDate, idiAdminCompanyID, idiUserID, idIuserTypeID;

            idiNewsID = $("#idiNewsID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsNewsTitle = $("#idsNewsTitle", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsNewsDescription = $("#idsNewsDescription", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsImage = $("#idsImage", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");

            iddtPostingDate = $("#iddtPostingDate", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiAdminCompanyID = $("#idiAdminCompanyID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiUserID = $("#idiUserID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idIuserTypeID = $("#idIuserTypeID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");


            document.getElementById("lblTitle").innerHTML = "Edit News";


            DisplayEditDialog();
            return false;
        }
        function DisplayEditDialog() {
            newEntry = "0";
            //            ddlCompanies txtFirstName txtLastName txtEmail txtUserName txtPassword txtPostCode txtAddress
            var dropdownlistbox = document.getElementById("<%= ddlNewsFeeds.ClientID %>")

            for (var x = 0; x < dropdownlistbox.length; x++) {
                if (idiNewsID == dropdownlistbox.options[x].value) {
                    dropdownlistbox.selectedIndex = x;
                    break;
                }
            }



            //idiNewsID, idsNewsTitle, idsNewsDescription, iddtPostingDate, idiAdminCompanyID, idiUserID, idIuserTypeID;   

            document.getElementById("<%= txtNewsTitle.ClientID %>").value = idsNewsTitle;
            document.getElementById("<%= txtNewsDescription.ClientID %>").value = idsNewsDescription;

            document.getElementById("<%= FileUpload1.ClientID %>").value = idsImage;

            document.getElementById("<%= txtPostingDate.ClientID %>").value = iddtPostingDate;



            $(".QTPopup").animate({ width: 'show' }, 'slow');
        }






        function fnAddNewDialog() {
            newEntry = "1";
            idiUserID = 0;

            var dropdownlistbox = document.getElementById("<%= ddlNewsFeeds.ClientID %>")


            dropdownlistbox.selectedIndex = 0;


            document.getElementById("<%= txtNewsTitle.ClientID %>").value = "";
            document.getElementById("<%= txtNewsDescription.ClientID %>").value = "";
            document.getElementById("<%= FileUpload1.ClientID %>").value = "";
            document.getElementById("<%= txtPostingDate.ClientID %>").value = "";


            $(".QTPopup").animate({ width: 'show' }, 'slow');

        }



    

        function UpdateValues(e) {

            if (newEntry == 1) {
                idiNewsID = "0";
                idIuserTypeID = "0";
                idiUserID = "0";

            }



            idIuserTypeID = $("#<%= ddlNewsFeeds.ClientID %> option:selected").val();


            var ctridsNewsTitle = document.getElementById("<%= txtNewsTitle.ClientID %>");
            var ctridsNewsDescription = document.getElementById("<%= txtNewsDescription.ClientID %>");
            var ctriddtPostingDate = document.getElementById("<%= txtPostingDate.ClientID %>");



            if (ctridsNewsTitle.value.length < 1) {
                ctridsNewsTitle.focus();
                alert('Please Enter Your  News Title  Name');
                return;
            }
            if (ctridsNewsDescription.value.length < 1) {
                ctridsNewsDescription.focus();
                alert('Please Enter News Description');
                return;
            }

            if (ctriddtPostingDate.value.length < 1) {
                ctriddtPostingDate.focus();
                alert('Please Enter The Posting Date');
                return;
            }





            idsNewsTitle = document.getElementById("<%= txtNewsTitle.ClientID %>").value;
            idsNewsDescription = document.getElementById("<%= txtNewsDescription.ClientID %>").value;

            idsImage = document.getElementById('<%=FileUpload1.ClientID%>').value;

            iddtPostingDate = document.getElementById("<%= txtPostingDate.ClientID %>").value;



            idiAdminCompanyID = document.getElementById("<%= idiAdminCompanyID.ClientID %>").value;
            idiUserID = document.getElementById("<%= idiUserID.ClientID %>").value;

            idsImage = "";

            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnSaveNewsFeeds",
                //FileName
                //string iNewsID, string strNewsTitle, string iUserID, string strNewsDescription, string dtPostingDate, string iAdminCompanyID,string iUserTypeID, string newEntry
                data: "{'iNewsID':'" + idiNewsID + "', 'strNewsTitle':'" + idsNewsTitle + "', 'iUserID':'" + idiUserID + "', 'strNewsDescription':'" + idsNewsDescription + "', 'dtPostingDate':'" + iddtPostingDate + "', 'iAdminCompanyID':'" + idiAdminCompanyID + "', 'iUserTypeID':'" + idIuserTypeID + "', 'newEntry':'" + newEntry.toString() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;

                    if (result != 0) {

                        $("#idiNewsID", row).text(idiNewsID);
                        $("#idsNewsTitle", row).text(idsNewsTitle);
                        $("#idsNewsTitle", row).attr("title", idsNewsTitle.toString());

                        $("#idsImage", row).text(idsImage);
                        $("#idsImage", row).attr("title", idsImage.toString());

                        $("#idsNewsDescription", row).text(idsNewsDescription);
                        $("#idsNewsDescription", row).attr("title", idsNewsDescription.toString());

                        $("#iddtPostingDate", row).text(iddtPostingDate);
                        $("#iddtPostingDate", row).attr("title", iddtPostingDate.toString());

                        CloseEditDialog();
                        $("#hfNewsFeedID", row).val(result);
                         <%= Page.ClientScript.GetPostBackEventReference(btnSaveDetails, String.Empty) %>;
                        //                        if (newEntry == 1)

                        //    __doPostBack('__Page', '');


                    }


                    if (result == 1) {

                        $("#idiNewsID", row).text(idiNewsID);
                        $("#idsNewsTitle", row).text(idsNewsTitle);
                        $("#idsNewsTitle", row).attr("title", idsNewsTitle.toString());

                        $("#idsImage", row).text(idsImage);
                        $("#idsImage", row).attr("title", idsImage.toString());

                        $("#idsNewsDescription", row).text(idsNewsDescription);
                        $("#idsNewsDescription", row).attr("title", idsNewsDescription.toString());

                        $("#iddtPostingDate", row).text(iddtPostingDate);
                        $("#iddtPostingDate", row).attr("title", iddtPostingDate.toString());




                        CloseEditDialog();

                         <%= Page.ClientScript.GetPostBackEventReference(btnSaveDetails, String.Empty) %>;
                        //                        if (newEntry == 1)

                        //    __doPostBack('__Page', '');


                    }

                    else if (result == 2) {

                        var lblMessage = document.getElementById("<%= lblMessage.ClientID %>");
                        lblMessage.innerHTML = "News already exists, Please Select  Different";
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

            $(".QTPopup").css('display', 'none');
        }
    </script>
    <table width="968" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="968" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top">
                            &nbsp;<asp:HiddenField ID="idiAdminCompanyID" runat="server" />
                            <asp:HiddenField ID="idiUserID" runat="server" />
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
                                                                                                    News Feeds
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
                                                            <td height="5" align="right">
                                                                <asp:HiddenField ID="hfNewsFeedID" ClientIDMode="Static" runat="server" />
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
                                                                            <td style="width: 100px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                News Title
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 200px" class="grid-header">
                                                                                New Description
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Posting Date
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
                                                                    <asp:ListView ID="lstNewsFeeds" runat="server">
                                                                        <LayoutTemplate>
                                                                            <tbody>
                                                                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                            </tbody>
                                                                        </LayoutTemplate>
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idsNewsTitle" title='<%# Eval("sNewsTitle") %>'>
                                                                                        <%# Eval("sNewsTitle") %></span>
                                                                                         <span id="idiNewsID" style="display: none;">
                                                                                            <%# Eval("iNewsID")%></span>
                                                                                            
                                                                                            
                                                                                             <span id="idiUserTypeID" style="display: none;">
                                                                                                <%# Eval("iUserTypeID")%></span> <span id="idiUserID" style="display: none;">
                                                                                                    <%# Eval("iUserID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsNewsDescription" title='<%# Eval("sNewsDescription") %>'>
                                                                                        <%# Eval("sNewsDescription")%></span>
                                                                                    <%--  
                                                                                        <span id="idiUserTypeID" style="display: none;">
                                                                                            <%# Eval("iUserTypeID")%></span>--%>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="iddtPostingDate" title='<%# Eval("dtPostingDate") %>'>
                                                                                        <%# Eval("dtPostingDate")%>
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
                                                                                    <span id="idsNewsTitle" title='<%# Eval("sNewsTitle") %>'>
                                                                                        <%# Eval("sNewsTitle") %></span> <span id="idiNewsID" style="display: none;">
                                                                                            <%# Eval("iNewsID")%></span> <span id="idiUserTypeID" style="display: none;">
                                                                                                <%# Eval("iUserTypeID")%></span> <span id="idiUserID" style="display: none;">
                                                                                                    <%# Eval("iUserID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsNewsDescription" title='<%# Eval("sNewsDescription") %>'>
                                                                                        <%# Eval("sNewsDescription")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="iddtPostingDate" title='<%# Eval("dtPostingDate") %>'>
                                                                                        <%# Eval("dtPostingDate")%></span>
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
                                                                    </tfoot>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
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
                                                                            <asp:DataPager ID="dtpNewsFeed" Visible="true" PageSize="25" runat="server" PagedControlID="lstNewsFeeds"
                                                                                OnPreRender="dtpNewsFeed_PreRender">
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
                                                <span id="lblTitle">Add New News</span>
                                            </div>
                                            <a href="#" class="closeBtn" title="Close"></a>
                                            <div class="content">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            Alerts
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:DropDownList ID="ddlNewsFeeds" ClientIDMode="Static" runat="server" Style="border: 0px;
                                                                            background: none; margin-top: 4px; width: 245px; background-color: transparent;">
                                                                            <asp:ListItem Value="0">For ALL</asp:ListItem>
                                                                            <asp:ListItem Value="4">For Patient/Customers Only</asp:ListItem>
                                                                            <asp:ListItem Value="2">For Doctors Only</asp:ListItem>
                                                                            <asp:ListItem Value="3">For Pharmasist Only</asp:ListItem>
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
                                                            News Title
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtNewsTitle" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtNewsTitle" runat="server" value="" style="border: 0px;
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
                                                            News Description
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                                                ControlToValidate="txtNewsDescription" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtNewsDescription" runat="server" value="" style="border: 0px;
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
                                                            UpLoad Image
                                                            </td>
                                                            <td  width="260" >
                                                            <div class="titlebarLeftc">
                                                             <div class="titlebarRightc">
                                                                <div class="titlebar" style="width: 250px;">
                                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                               
                                                                
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF|.jpeg|JPEG)$"
                                                                        ControlToValidate="FileUpload1"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div></div>
                                                            </td>
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
                            Posting&nbsp; Date
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                                ControlToValidate="txtPostingDate" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                        </td>
                        <td width="260">
                            <div class="titlebarLeftc">
                                <div class="titlebarRightc">
                                    <div class="titlebar" style="width: 250px;">
                                        <%-- <input type="text" id="txtPostingDate" runat="server" value="" style="border: 0px; background: none;
                                                                            margin-top: 5px; width: 245px;" />--%>
                                        <asp:TextBox ID="txtPostingDate" runat="server" Style="border: 0px; background: none;
                                            margin-top: 5px; width: 245px;"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtPostingDate" runat="server">
                                        </cc1:CalendarExtender>
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
                                ValidationGroup="grpValidateExpertDetials" CausesValidation="true" OnClientClick="UpdateValues(this); return false;"
                                OnClick="btnSaveDetails_Click" />
                            <input id="btnCancel" type="button" class="default_button_3" value="Cancel" onclick="javascript:CloseEditDialog();" />
                        </td>
                        <td>
                            <asp:Label ID="lblMessage" Font-Size="11px" Font-Bold="true" runat="server" Text="saved"
                                Style="display: none;"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                </div> </div> </div>
                <div class="gpBdrLeftBottom">
                </div>
                <div class="gpBdrRightBottom">
                </div>
                <div class="gpBdrBottom">
                </div>
                </div> </div>
            </td>
        </tr>
        <tr>
            <td height="15px">
            </td>
        </tr>
    </table>
    </td> </tr> </table>
</asp:Content>
