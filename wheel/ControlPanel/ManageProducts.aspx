<%@ page title="" language="C#" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_ManageProducts, App_Web_zarixrtn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
            width: 266px;
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
        /*---popup styles ends here ----- */
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

        var idiProductID, idsName, idsDescription, idnPrice, idnTax, idiAdminCompanyID, iddtCreatedDate, idiProductTypeID, idiCode, idiUserID, idsProductType;


        function DeleteProduct(deleteButton) {
            row = $(deleteButton).parent().parent();

            var agree = confirm("Are you sure you want to delete this record?");
            if (!agree)
                return false;

            idiProductID = $("#idiProductID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnDeleteProduct",
                data: "{'iProductID':'" + idiProductID + "'}",
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

            idiProductID = $("#idiProductID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsName = $("#idsName", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsDescription = $("#idsDescription", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idnPrice = $("#idnPrice", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idnTax = $("#idnTax", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiAdminCompanyID = $("#idiAdminCompanyID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiProductTypeID = $("#idiProductTypeID", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idiCode = $("#idiCode", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            idsProductType = $("#idsProductType", row).text().replace(/^\s+/, "").replace(/^\s+|\s+$/g, "");
            row.addClass("highlightRow");

            document.getElementById("lblTitle").innerHTML = "Edit Product";


            DisplayEditDialog();
            return false;
        }
        function DisplayEditDialog() {
            newEntry = "0";

            //            ddlCompanyTypes, txtCompanyName, txtEmail, txtAddress, txtPostCode
            //            idiCompanyID, idsTypeName, idiCompanyTypeID, idsCompanyName, idsEmail, idsPostcode, hfAdminCompanyID

            var desiredValue = idsProductType;
            var el = document.getElementById("<%= ddlProductTypes.ClientID %>");
            for (var i = 0; i < el.options.length; i++) {
                if (el.options[i].text == desiredValue) {
                    el.selectedIndex = i;
                    break;
                }
            }

            document.getElementById("<%= txtName.ClientID %>").value = idsName;
            document.getElementById("<%= txtCode.ClientID %>").value = idiCode;
            document.getElementById("<%= txtDescription.ClientID %>").value = idsDescription;
            document.getElementById("<%= txtPrice.ClientID %>").value = idnPrice;
            document.getElementById("<%= txtTax.ClientID %>").value = idnTax;
            //            //            document.getElementById("<%= ddlProductTypes.ClientID %>").value = idiProductTypeID;
            //            $("#<%= ddlProductTypes.ClientID %> option[value='" + idiProductTypeID + "']").attr("selected", "selected");
            //            //            $("#editForm").show();


            $(".QTPopup").animate({ width: 'show' }, 'slow');
        }

        function fnAddNewDialog() {

            newEntry = "1";
            idiProductID = "0";
            var desiredValue = idsName;
            var el = document.getElementById("ddlProductTypes");
            el.selectedIndex = 0;
            document.getElementById("<%= txtName.ClientID %>").value = "";
            document.getElementById("<%= txtCode.ClientID %>").value = "";
            document.getElementById("<%= txtDescription.ClientID %>").value = "";
            document.getElementById("<%= txtPrice.ClientID %>").value = "";
            document.getElementById("<%= txtTax.ClientID %>").value = "";

            document.getElementById("lblTitle").innerHTML = "Add New Product";
            $(".QTPopup").animate({ width: 'show' }, 'slow');

        }


        function UpdateValues(e) {

            var el = document.getElementById("<%= ddlProductTypes.ClientID%>");
            idsName = el.options[el.selectedIndex].text;
            idiProductTypeID = el.options[el.selectedIndex].value;

            if (idiProductTypeID.length < 1 || idiProductTypeID == -1) {
                alert("Please Select Product Type");
                return;
            }

            //            idsProductType = document.getElementById("<%= ddlProductTypes.ClientID %>").value;
            //            idsName = el.options[el.selectedIndex].text;
            //            idiProductTypeID = el.options[el.selectedIndex].value;

            //            if (idiProductTypeID.length < 1 || idiProductTypeID == -1)
            //                         {
            //                            alert("Please Select Product Type");
            //                            return;
            //                        }


            var ctridsName = document.getElementById("<%= txtName.ClientID %>");
            var ctridiCode = document.getElementById("<%= txtCode.ClientID %>");

            var ctridnPrice = document.getElementById("<%= txtPrice.ClientID %>");
            var ctridnTax = document.getElementById("<%= txtTax.ClientID %>");

            var el = document.getElementById("<%= ddlProductTypes.ClientID %>");


            if (ctridsName.value.length < 1) {
                ctridsName.focus();
                alert('Please Enter Your Product  Name');
                return;
            }

            if (ctridiCode.value.length < 1) {
                ctridiCode.focus();
                alert('Please Enter Product Code')
                return;
            }

            if (ctridnPrice.value.length < 1) {
                ctridnPrice.focus();
                alert('Please Product Price')
                return;
            }

            if (ctridnTax.value.length < 1) {
                ctridnTax.focus();
                alert('Please Enter The Tax')
                return;
            }

            idsName = document.getElementById("<%= txtName.ClientID %>").value;
            idiCode = document.getElementById("<%= txtCode.ClientID %>").value;
            idsDescription = document.getElementById("<%= txtDescription.ClientID %>").value;
            idnPrice = document.getElementById("<%= txtPrice.ClientID %>").value;
            idnTax = document.getElementById("<%= txtTax.ClientID %>").value;


            idiAdminCompanyID = document.getElementById("<%= idiAdminCompanyID.ClientID %>").value;
            idiUserID = document.getElementById("<%= idiUserID.ClientID %>").value;
            if (idiProductID == "")
                idiProductID = 0;
            //int iProductID, string sName, string sDescription, double nPrice, double nTax, int iAdminCompanyID, string dtCreatedDate, int iProductTypeID, int iCode,int newEntry, string sProductType

            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnSaveProducts",
                //    public int fnSaveProducts(int iProductID, string sName, string sDescription, int nPrice, int nTax, int newEntry,int iAdminCompanyID)
                data: "{'iProductID':'" + idiProductID + "','sName':'" + idsName + "', 'sDescription':'" + idsDescription + "', 'nPrice':'" + idnPrice + "', 'nTax':'" + idnTax + "', 'iAdminCompanyID':'" + idiAdminCompanyID + "', 'iProductTypeID':'" + idiProductTypeID + "','iCode':'" + idiCode + "', 'newEntry':'" + newEntry + "', 'sProductType':'" + idsProductType + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == 1) {
                        if (idiProductID > 0) {
                            $("#idsName", row).text(idsName);

                            $("#idiProductID", row).text(idiProductID);
                            $("#idiProductTypeID", row).text(idiProductTypeID);
                            $("#idiCode", row).text(idiCode);
                            $("#idsDescription", row).text(idsDescription);
                            $("#idnPrice", row).text(idnPrice);
                            $("#idnTax", row).text(idnTax);
                            $("#idiAdminCompanyID", row).text(idiAdminCompanyID);
                            $("#idsProductType", row).text(idsProductType);
                        }
                        CloseEditDialog();


                        if (newEntry == 1)
                            __doPostBack('__Page', '');


                    }
                    else if (result == 2) {

                        var lblMessage = document.getElementById("<%= lblMessage.ClientID %>");
                        lblMessage.innerHTML = "Product already exists, Please Select  Different";
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
                                                                                                    Products
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
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                    <thead>
                                                                        <tr>
                                                                            <td style="width: 100px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                Product ID
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Product Name
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Product Code
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Product Type
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 100px" class="grid-header">
                                                                                Price
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                            </td>
                                                                            <td width="5" class="grid-header">
                                                                            </td>
                                                                            <td style="width: 70px" class="grid-header">
                                                                                Tax
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
                                                                    <asp:ListView ID="lstProducts" runat="server">
                                                                        <LayoutTemplate>
                                                                            <tbody>
                                                                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                            </tbody>
                                                                        </LayoutTemplate>
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idiProductID" title='<%# Eval("iProductID") %>'>
                                                                                        <%# Eval("iProductID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsName" title='<%# Eval("sName") %>'>
                                                                                        <%# Eval("sName")%></span> <span id="idiProductTypeID" style="display: none;">
                                                                                            <%# Eval("iProductTypeID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idiCode" title='<%# Eval("sProductCode") %>'>
                                                                                        <%# Eval("sProductCode")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsDescription" style="display: none;" title='<%# Eval("sDescription") %>'>
                                                                                        <%# Eval("sDescription")%>
                                                                                    </span><span id="idsProductType" title='<%# Eval("sProductType") %>'>
                                                                                        <%# Eval("sProductType")%>
                                                                                    </span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idnPrice" title='<%# Eval("nPrice") %>'>
                                                                                        <%# Eval("nPrice")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idnTax" title='<%# Eval("nTax") %>'>
                                                                                        <%# Eval("nTax")%></span>
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
                                                                                        onclick="javascript:DeleteProduct(this);" />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <AlternatingItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idiProductID" title='<%# Eval("iProductID") %>'>
                                                                                        <%# Eval("iProductID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsName" title='<%# Eval("sName") %>'>
                                                                                        <%# Eval("sName")%></span> <span id="idiProductTypeID" style="display: none;">
                                                                                            <%# Eval("iProductTypeID")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idiCode" title='<%# Eval("sProductCode") %>'>
                                                                                        <%# Eval("sProductCode")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsDescription" style="display: none;" title='<%# Eval("sDescription") %>'>
                                                                                        <%# Eval("sDescription")%></span> <span id="idsProductType" title='<%# Eval("sProductType") %>'>
                                                                                            <%# Eval("sProductType")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idnPrice" title='<%# Eval("nPrice") %>'>
                                                                                        <%# Eval("nPrice")%></span>
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idnTax" title='<%# Eval("nTax") %>'>
                                                                                        <%# Eval("nTax")%></span>
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
                                                                                    <img src="images/icon-delete.png" width="9" height="10" style="cursor: pointer" onclick="javascript:DeleteProduct(this);" />
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
                                                                                            <asp:DataPager ID="dtpProducts" Visible="true" PageSize="20" runat="server" PagedControlID="lstProducts"
                                                                                                OnPreRender="dtpProducts_PreRender">
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
                                                <span id="lblTitle">Add New Product</span>
                                            </div>
                                            <a href="#" class="closeBtn" title="Close"></a>
                                            <div class="content">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            Product Type<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                ErrorMessage="*" SetFocusOnError="true" InitialValue="-1" ValidationGroup="validateProduct"
                                                                ControlToValidate="ddlProductTypes"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:DropDownList ID="ddlProductTypes" ClientIDMode="Static" runat="server" Style="border: 0px;
                                                                            background: none; margin-top: 5px; width: 245px;">
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
                                                            Product Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                                ErrorMessage="*" SetFocusOnError="true" ValidationGroup="validateProduct" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtName" runat="server" value="" style="border: 0px; background: none;
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
                                                            Product Code<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                                ErrorMessage="*" SetFocusOnError="true" ValidationGroup="validateProduct" ControlToValidate="txtCode"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtCode" runat="server" value="" style="border: 0px; background: none;
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
                                                            Description
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <asp:TextBox ID="txtDescription" ClientIDMode="Static" runat="server" Style="border: 0px;
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
                                                            Price
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"
                                                                runat="server" ErrorMessage="*" ControlToValidate="txtPrice" ValidationGroup="validateProduct"></asp:RegularExpressionValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtPrice" runat="server" value="" style="border: 0px; background: none;
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
                                                            Tax
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"
                                                                runat="server" ErrorMessage="*" ControlToValidate="txtTax" ValidationGroup="validateProduct"></asp:RegularExpressionValidator>
                                                        </td>
                                                        <td width="260">
                                                            <div class="titlebarLeftc">
                                                                <div class="titlebarRightc">
                                                                    <div class="titlebar" style="width: 250px;">
                                                                        <input type="text" id="txtTax" runat="server" value="" style="border: 0px; background: none;
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
                                                            <%--  <input id="btnSaveDetails" class="gbtn_s" value="Save" 
                                                                onclick="UpdateValues(); return false;" />--%>
                                                            <asp:Button ID="btnSaveDetails" CssClass="default_button_3" runat="server" Text="Save" ValidationGroup="validateProduct"
                                                                CausesValidation="true" OnClientClick="UpdateValues(); return false;" />
                                                            <%-- <input id="btnCancel" class="gbtn_s"  value="Cancel" onclick="CloseEditDialog();" />--%>
                                                            <asp:Button ID="btnCancel" CssClass="default_button_3" CausesValidation="false" runat="server"
                                                                Text="Cancel" OnClientClick="CloseEditDialog();" />
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
