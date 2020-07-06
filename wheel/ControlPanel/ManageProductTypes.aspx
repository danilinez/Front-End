<%@ page title="" masterpagefile="~/ControlPanel/AdminPanel.master" language="C#" autoeventwireup="true" inherits="ControlPanel_ManageProductTypes, App_Web_zarixrtn" %>

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
            min-height: 120px;
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
        var idiProductTypeID, idsType, iAdminCompanyID;


        function DeleteProductsTypes(deleteButton) {
            row = $(deleteButton).parent().parent();

            var agree = confirm("Are you sure you want to delete this record?");
            if (!agree)
                return false;

            idsType = $("#idsType", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiProductTypeID = $("#idiProductTypeID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnDeleteProductsTypes",
                data: "{'iProductTypeID':'" + idiProductTypeID + "'}",
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

            idsType = $("#idsType", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiProductTypeID = $("#idiProductTypeID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");

            row.addClass("highlightRow");

            document.getElementById("lblTitle").innerHTML = "Edit Product Type";


            DisplayEditDialog();
            return false;
        }
        function DisplayEditDialog() {
            newEntry = "0";

            document.getElementById("<%= txtProductType.ClientID %>").value = idsType;
            document.getElementById("<%= txtProductTypeID.ClientID %>").value = idiProductTypeID;
            //           
            //            $("#editForm").show();


            $(".QTPopup").animate({ width: 'show' }, 'slow');
        }

        function fnAddNewDialog() {
            newEntry = "1";
            document.getElementById("<%= txtProductType.ClientID %>").value = "";
            document.getElementById("<%= txtProductTypeID.ClientID %>").value = "";

            document.getElementById("lblTitle").innerHTML = "Add New Product Type";
            $(".QTPopup").animate({ width: 'show' }, 'slow');

        }


        function UpdateValues(e) {

            var ctridsType = document.getElementById("<%= txtProductType.ClientID %>");

            if (ctridsType.value.length < 1) {
                ctridsType.focus();
                alert('Please Enter The Product Type')
                return;
            }

            idsType = document.getElementById("<%= txtProductType.ClientID %>").value;
            idiProductTypeID = document.getElementById("<%= txtProductTypeID.ClientID %>").value;
            iAdminCompanyID = document.getElementById("<%= idiAdminCompanyID.ClientID %>").value;

            if (idiProductTypeID == "")
                idiProductTypeID = 0;


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnSaveProductsTypes",
                data: "{'iProductTypeID':'" + idiProductTypeID + "', 'sType':'" + idsType + "', 'newEntry':'" + newEntry + "', 'iAdminCompanyID':'" + iAdminCompanyID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == 1) {
                        $("#idsType", row).text(idsType);
                        $("#idiProductTypeID", row).text(idiProductTypeID);

                        CloseEditDialog();


                        if (newEntry == 1)
                            __doPostBack('__Page', '');


                    }
                    else if (result == 2) {

                        var lblMessage = document.getElementById("<%= lblMessage.ClientID %>");
                        lblMessage.innerHTML = "Product Type already exists, Please Select  Different";
                        lblMessage.style.color = "#861012";
                        lblMessage.style.display = "block";

                        //                        alert('Company Type already exists, Please Select  Different');
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
    </script>
    <table width="968" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="968" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top">
                            &nbsp;<asp:HiddenField ID="idiAdminCompanyID" runat="server" />
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
                                                                                                    Product Types
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
                                                            <td class="style2">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td align="right" height="5px">
                                                                            &nbsp;
                                                                            <input id="Button2" type="button" class="gbtn_s" style="background: url(images/btn-addnew.png);
                                                                                width: 94px; height: 33px" onclick="javascript:fnAddNewDialog();" />
                                                                        </td>
                                                                        <td width="5">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="80" align="right">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="95" align="right">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="5">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="94">
                                                                            &nbsp;
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
                                                            <td align="center">
                                                                <table width="400" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                    <thead>
                                                                        <tr>
                                                                            <td style="width: 50px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                Type ID
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 200px" class="grid-header">
                                                                                Product Type
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
                                                                    <asp:ListView ID="lstProductTypes" runat="server">
                                                                        <LayoutTemplate>
                                                                            <tbody>
                                                                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                            </tbody>
                                                                        </LayoutTemplate>
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idiProductTypeID" title='<%# Eval("iProductTypeID") %>'>
                                                                                        <%# Eval("iProductTypeID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsType" title='<%# Eval("sType") %>'>
                                                                                        <%# Eval("sType")%></span>
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
                                                                                    <img src="images/icon-delete.png" width="9" height="10" style="cursor: pointer" onclick="javascript:DeleteProductsTypes(this);" />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <AlternatingItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px;">
                                                                                    <span id="idiProductTypeID" title='<%# Eval("iProductTypeID") %>'>
                                                                                        <%# Eval("iProductTypeID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsType" title='<%# Eval("sType") %>'>
                                                                                        <%# Eval("sType")%></span>
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
                                                                                    <img src="images/icon-delete.png" width="9" height="10" style="cursor: pointer" onclick="javascript:DeleteProductsTypes(this);" />
                                                                                </td>
                                                                            </tr>
                                                                        </AlternatingItemTemplate>
                                                                    </asp:ListView>
                                                                    <tfoot class="paging">
                                                                        <tr>
                                                                            <td height="30" colspan="9">
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
                                                                                            <asp:DataPager ID="dtpProductTypes" Visible="true" PageSize="20" runat="server" PagedControlID="lstProductTypes"
                                                                                                OnPreRender="dtpProductsTypes_PreRender">
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
                                                <span id="lblTitle">Add New Product Type </span>
                                            </div>
                                            <a href="#" class="closeBtn" title="Close"></a>
                                            <div class="content">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            Product Type<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                ErrorMessage="*" ControlToValidate="txtProductType"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtProductType" runat="server" value="" style="border: 0px;
                                                                            background: none; margin-top: 5px; width: 245px;" />
                                                                        <input type="text" id="txtProductTypeID" runat="server" value="" style="display: none;
                                                                            border: 0px; background: none; margin-top: 5px; width: 5px;" />
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
                                                            <asp:Button ID="btnSaveDetails" CssClass="default_button_3" runat="server" Text="Save" OnClientClick="UpdateValues(); return false;" />
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
                    <tr>
                        <td height="15px">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
