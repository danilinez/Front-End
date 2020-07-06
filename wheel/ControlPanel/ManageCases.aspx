<%@ page title="" language="C#" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_ManageCases, App_Web_zarixrtn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="968" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="968" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top">
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
                                                                                                    Manage Cases
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
                                                            <td height="3px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <%-- <input id="btnAddNewCase" type="button" class="gbtn_s" style="background: url(images/btn-addnew.png);
                                                                    width: 94px; height: 33px" onclick="javascript:fnAddNewDialog();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="3px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="5">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="btnAddNewCase" CssClass="default_button_3" runat="server" Text="Add Case"
                                                                                CausesValidation="False" OnClick="btnAddNewCase_Click" />
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="5">
                                                                <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td>
                                                                            Case Reference
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtCaseRef" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            Doctor Name
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtDocName" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            Case Date
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtCase_Date" runat="server"></asp:TextBox>
                                                                            <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtCase_Date" runat="server">
                                                                            </asp:CalendarExtender>
                                                                        </td>
                                                                        <td>
                                                                            Location Name
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtLocationName" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <%-- <asp:Button ID="btnSearch" CssClass="gbtn_s" runat="server" Style="background: url(images/btn-search.png);
                                                                                width: 94px; height: 33px" CausesValidation="true" OnClick="btnSearch_Click" />--%>
                                                                            <asp:Button ID="btnSearch" CssClass="default_button_3" runat="server" Text="search"
                                                                                CausesValidation="False" OnClick="btnSearch_Click" />
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
                                                                <table border="0" cellpadding="0" cellspacing="0" class="grid" width="100%">
                                                                    <thead>
                                                                        <tr>
                                                                            <td class="grid-header" style="width: 180px; height: 30px; padding-left: 5px;">
                                                                                Case Refrence
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td bgcolor="#CCCCCC" width="1">
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td class="grid-header" style="width: 100px">
                                                                                Case Date
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td bgcolor="#CCCCCC" width="1">
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td class="grid-header" style="width: 100px">
                                                                                Case Status
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td bgcolor="#CCCCCC" width="1">
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td class="grid-header" style="width: 100px">
                                                                                Case Description
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td bgcolor="#CCCCCC" width="1">
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td class="grid-header" style="width: 150px">
                                                                                Created Date
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td bgcolor="#CCCCCC" width="1">
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td class="grid-header" style="width: 150px">
                                                                                Patient Name
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td bgcolor="#CCCCCC" width="1">
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td class="grid-header" style="width: 150px">
                                                                                Doctor Name
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td bgcolor="#CCCCCC" width="1">
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td class="grid-header" style="width: 150px">
                                                                                Location Name
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td bgcolor="#CCCCCC" width="1">
                                                                            </td>
                                                                            <td class="grid-header" width="5">
                                                                            </td>
                                                                            <td class="grid-header" style="width: 40px">
                                                                                Action
                                                                            </td>
                                                                        </tr>
                                                                    </thead>
                                                                    <asp:ListView ID="lstCase" runat="server" OnItemCommand="lstCase_ItemCommand">
                                                                        <LayoutTemplate>
                                                                            <tbody>
                                                                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                            </tbody>
                                                                        </LayoutTemplate>
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idiCaseID" style="display: none;" title='<%# Eval("iCaseID") %>'>
                                                                                        <%# Eval("iCaseID")%></span><span id="idsCaseRefNo" title='<%# Eval("sCaseRefNo") %>'><%# Eval("sCaseRefNo")%></span>
                                                                                </td>
                                                                                <%-- <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                </td>
                                                                                <td width="5" class="grid-border-bottom">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsCaseRefNo" title='<%# Eval("sCaseRefNo") %>'>
                                                                                        <%# Eval("sCaseRefNo")%></span> 
                                                                                </td>--%>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="iddtCaseDate" title='<%# Eval("dtCaseDate") %>'>
                                                                                        <%# Eval("dtCaseDate")%></span>
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsCaseStatus" title='<%# Eval("sCaseStatus") %>'>
                                                                                        <%# Eval("sCaseStatus")%></span>
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsCaseDiscription" title='<%# Eval("sCaseDiscription") %>'>
                                                                                        <%# Eval("sCaseDiscription")%></span>
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="iddtCreatedDate" title='<%# Eval("dtCreatedDate") %>'>
                                                                                        <%# Eval("dtCreatedDate")%></span>
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsPatientName" title='<%# Eval("sPatientName") %>'>
                                                                                        <%# Eval("sPatientName")%></span>
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsDoctorName" title='<%# Eval("sDoctorName") %>'>
                                                                                        <%# Eval("sDoctorName")%></span>
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <span id="idsLocationName" title='<%# Eval("sLocationName") %>'>
                                                                                        <%# Eval("sLocationName")%></span>
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-border-bottom">
                                                                                    <asp:ImageButton ID="btn_Edit" CausesValidation="false" runat="server" CommandArgument='<%# Eval("iCaseID")%>'
                                                                                        CommandName="EditCase" ImageUrl="images/icon-view-edit.png" />
                                                                                    <asp:ImageButton ID="btn_Delete" CausesValidation="false" runat="server" CommandArgument='<%# Eval("iCaseID")%>'
                                                                                        CommandName="DeleteCase" OnClientClick="javascript:if(confirm('Are you sure you want to delete this Case?')) return true; else return false;"
                                                                                        ImageUrl="images/icon-delete.png" />
                                                                                    <asp:ImageButton ID="ImageButton1" CausesValidation="false" Width="9px" Height="10px"
                                                                                        runat="server" CommandArgument='<%# Eval("iCaseID")%>' CommandName="ViewCase"
                                                                                        ImageUrl="images/icon-view1.png" />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <AlternatingItemTemplate>
                                                                            <tr>
                                                                                <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                    <span id="idsCaseRefNo" title='<%# Eval("sCaseRefNo") %>'>
                                                                                        <%# Eval("sCaseRefNo")%></span>
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="iddtCaseDate" title='<%# Eval("dtCaseDate") %>'>
                                                                                        <%# Eval("dtCaseDate")%></span>
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsCaseStatus" title='<%# Eval("sCaseStatus") %>'>
                                                                                        <%# Eval("sCaseStatus")%></span>
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsCaseDiscription" title='<%# Eval("sCaseDiscription") %>'>
                                                                                        <%# Eval("sCaseDiscription")%></span>
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="iddtCreatedDate" title='<%# Eval("dtCreatedDate") %>'>
                                                                                        <%# Eval("dtCreatedDate")%></span>
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsPatientName" title='<%# Eval("sPatientName") %>'>
                                                                                        <%# Eval("sPatientName")%></span>
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsDoctorName" title='<%# Eval("sDoctorName") %>'>
                                                                                        <%# Eval("sDoctorName")%></span>
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <span id="idsLocationName" title='<%# Eval("sLocationName") %>'>
                                                                                        <%# Eval("sLocationName")%></span>
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td bgcolor="#CCCCCC" width="1">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom" width="5">
                                                                                </td>
                                                                                <td class="grid-bg-color grid-border-bottom">
                                                                                    <asp:ImageButton ID="btn_Edit" CausesValidation="false" runat="server" CommandArgument='<%# Eval("iCaseID")%>'
                                                                                        CommandName="EditCase" ImageUrl="images/icon-view-edit.png" />
                                                                                    <asp:ImageButton ID="btn_Delete" CausesValidation="false" runat="server" CommandArgument='<%# Eval("iCaseID")%>'
                                                                                        CommandName="DeleteCase" OnClientClick="javascript:if(confirm('Are you sure you want to delete this Case?')) return true; else return false;"
                                                                                        ImageUrl="images/icon-delete.png" />
                                                                                    <asp:ImageButton ID="ImageButton1" CausesValidation="false" Width="9px" Height="10px"
                                                                                        runat="server" CommandArgument='<%# Eval("iCaseID")%>' CommandName="ViewCase"
                                                                                        ImageUrl="images/icon-view1.png" />
                                                                                </td>
                                                                            </tr>
                                                                        </AlternatingItemTemplate>
                                                                    </asp:ListView>
                                                                    <tfoot class="paging">
                                                                        <tr>
                                                                            <td colspan="33" height="30">
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td height="5" width="10">
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
                                                                                            <asp:DataPager ID="dtpCase" runat="server" OnPreRender="dtpCase_PreRender" PagedControlID="lstCase"
                                                                                                PageSize="20" Visible="true">
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
                                                                                        <td height="5" width="10">
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
                                                    <asp:Button ID="btnPopUP" runat="server" Text="POPUP" Style="display: none;" />
                                                    <asp:HyperLink ID="HyperLink1" runat="server" Style="display: none;">HyperLink</asp:HyperLink>
                                                    <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server" BackgroundCssClass="modalBackground"
                                                        CancelControlID="btnCancelBooking" DropShadow="false" PopupControlID="pnlBookAppointment"
                                                        TargetControlID="HyperLink1">
                                                    </asp:ModalPopupExtender>
                                                    <asp:Panel ID="pnlBookAppointment" runat="server" Style="display: none;" Width="420px">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td class="panel_style">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td colspan="2" class="inner_hd1">
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td>
                                                                                            Add New Case
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="new_input_field_contnr">
                                                                                Select Doctor
                                                                                <asp:RequiredFieldValidator ID="rfvddlDoctorName" runat="server" ForeColor="Maroon"
                                                                                    ControlToValidate="ddlDoctorName" ErrorMessage="*" InitialValue="-1"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlDoctorName" runat="server" CssClass="field-220" Width="100px"
                                                                                    OnSelectedIndexChanged="ddlMedicalDoctors_SelectedIndexChanged" AutoPostBack="True">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Avaliable Slots:
                                                                                <asp:RequiredFieldValidator ID="rfvddlAppointmentDetail" runat="server" ForeColor="Maroon"
                                                                                    ControlToValidate="ddlAppointmentDetail" ErrorMessage="*" InitialValue="-1"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlAppointmentDetail" runat="server" CssClass="field-220" Width="200px"
                                                                                    OnSelectedIndexChanged="ddlAppointmentDetail_SelectedIndexChanged" AutoPostBack="True">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                                <asp:Label ID="lblAppointmentDetail" ForeColor="DarkGreen" Font-Size="11px" runat="server"
                                                                                    Font-Bold="false" Text="Appointment Detail"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Case Ref No#:
                                                                                <asp:RequiredFieldValidator ID="rfvtxtCaseRefNo" ForeColor="Maroon" ControlToValidate="txtCaseRefNo"
                                                                                    runat="server" ErrorMessage="*" ValidationGroup="validateCaseDetials"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtCaseRefNo" runat="server" CssClass="field-220"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Case Date:
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Maroon" ControlToValidate="txtCaseDate"
                                                                                    runat="server" ErrorMessage="*" ValidationGroup="validateCaseDetials"></asp:RequiredFieldValidator>
                                                                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtCaseDate"
                                                                                    PopupPosition="BottomLeft" Enabled="true">
                                                                                </asp:CalendarExtender>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Maroon"
                                                                                    runat="server" ValidationGroup="validateCaseDetials" ControlToValidate="txtCaseDate"
                                                                                    Enabled="true" SetFocusOnError="true" ErrorMessage="*" ToolTip="* Invalid date Format e.g. MM/DD/YYYY"
                                                                                    ValidationExpression="^((((0[13578])|([13578])|(1[02]))[\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\/](([1-9])|([0-2][0-9]))))[\/]\d{4}$|^\d{4}$"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <td>
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            <asp:TextBox ID="txtCaseDate" runat="server" CssClass="field-220" Width="100px"></asp:TextBox>
                                                                                            <asp:CalendarExtender ID="CalendarExtender4" TargetControlID="txtCaseDate" runat="server">
                                                                                            </asp:CalendarExtender>
                                                                                        </td>
                                                                                        <td>
                                                                                            Status:
                                                                                            <asp:RequiredFieldValidator ID="rfvddlCaseStatus" runat="server" ForeColor="Maroon"
                                                                                                ControlToValidate="ddlCaseStatus" ErrorMessage="*" InitialValue="-1"></asp:RequiredFieldValidator>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="ddlCaseStatus" runat="server" CssClass="field-220" Width="100px">
                                                                                                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                                                                                                <asp:ListItem Value="Close" Text="Close"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Select Patient:
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Maroon" ControlToValidate="ddlPatients"
                                                                                    InitialValue="-1" runat="server" ErrorMessage="*" ValidationGroup="validateCaseDetials"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlPatients" runat="server" CssClass="field-220" AutoPostBack="True"
                                                                                    OnSelectedIndexChanged="ddlPatients_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                First Name:
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Maroon" ControlToValidate="txtPatientFirstName"
                                                                                    runat="server" ErrorMessage="*" ValidationGroup="validateCaseDetials"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPatientFirstName" runat="server" CssClass="field-220"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Last Name:
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Maroon" ControlToValidate="txtPatientLastName"
                                                                                    runat="server" ErrorMessage="*" ValidationGroup="validateCaseDetials"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPatientLastName" runat="server" CssClass="field-220"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top">
                                                                                Case Description:
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Maroon" ControlToValidate="txtCaseDescription"
                                                                                    runat="server" ErrorMessage="*" ValidationGroup="validateCaseDetials"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtCaseDescription" TextMode="MultiLine" runat="server" CssClass="field-220"
                                                                                    Rows="5"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Gender:
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Maroon" ControlToValidate="ddlPatientGender"
                                                                                    InitialValue="-1" runat="server" ErrorMessage="*" ValidationGroup="validateCaseDetials"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="ddlPatientGender" runat="server" CssClass="field-220" Width="100px">
                                                                                    <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                                                                    <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                DOB:<asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtPatientDOB"
                                                                                    PopupPosition="BottomLeft" Enabled="true">
                                                                                </asp:CalendarExtender>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Maroon"
                                                                                    runat="server" ValidationGroup="validateCaseDetials" ControlToValidate="txtCaseDate"
                                                                                    Enabled="true" SetFocusOnError="true" ErrorMessage="*" ToolTip="* Invalid date Format e.g. MM/DD/YYYY"
                                                                                    ValidationExpression="^((((0[13578])|([13578])|(1[02]))[\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\/](([1-9])|([0-2][0-9]))))[\/]\d{4}$|^\d{4}$"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPatientDOB" runat="server" CssClass="field-220"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Address
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPatientAddress" runat="server" CssClass="field-220"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Post Code
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPatientPostCode" runat="server" CssClass="field-220"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Phone
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPatientPhone" runat="server" CssClass="field-220"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="height: 3px;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Email
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*"
                                                                                    ForeColor="Maroon" ToolTip="* Wrong Format" ControlToValidate="txtPatientEmail"
                                                                                    ValidationGroup="validateCaseDetials" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPatientEmail" runat="server" CssClass="field-220"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblCaseBookingError" runat="server" ForeColor="Maroon" Font-Size="11px"
                                                                                    Font-Bold="true" Visible="false" Text="Error in Saving"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="right">
                                                                                &nbsp;
                                                                                <asp:Button ID="btnBookCase" CausesValidation="true" runat="server" CssClass="default_button_3"
                                                                                    Text="Book Case" ValidationGroup="validateCaseDetials" OnClick="btnBookCase_Click" />&nbsp;
                                                                                <asp:Button ID="btnCancelBooking" runat="server" Text="Cancel" CssClass="default_button_3"
                                                                                    CausesValidation="false" OnClick="btnCancelBooking_Click" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
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
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
