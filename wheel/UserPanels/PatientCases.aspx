<%@ page language="C#" title="" masterpagefile="~/UserPanels/Client.master" autoeventwireup="true" inherits="UserPanels_PatientCases, App_Web_2fwj3ljd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="968" border="0" cellspacing="0" cellpadding="0" class="mainbox">
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
                                                                Cases
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
                        <td align="center">
                            <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
                                <thead>
                                    <tr>
                                        <td style="width: 100px; height: 30px; padding-left: 5px;" class="grid-header">
                                            Expert Name
                                        </td>
                                        <td width="5" class="grid-header">
                                        </td>
                                        <td width="1" bgcolor="#CCCCCC">
                                        </td>
                                        <td width="5" class="grid-header">
                                        </td>
                                        <td style="width: 100px" class="grid-header">
                                            Appointment Date
                                        </td>
                                        <td width="5" class="grid-header">
                                        </td>
                                        <td width="1" bgcolor="#CCCCCC">
                                        </td>
                                        <td width="5" class="grid-header">
                                        </td>
                                        <td style="width: 100px" class="grid-header">
                                            Time From
                                        </td>
                                        <td width="5" class="grid-header">
                                        </td>
                                        <td width="1" bgcolor="#CCCCCC">
                                        </td>
                                        <td width="5" class="grid-header">
                                        </td>
                                        <td style="width: 100px" class="grid-header">
                                            Time To
                                        </td>
                                        <td width="5" class="grid-header">
                                        </td>
                                        <td width="1" bgcolor="#CCCCCC">
                                        </td>
                                        <td width="5" class="grid-header">
                                        </td>
                                        <td style="width: 100px" class="grid-header">
                                            Venue
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
                                <asp:ListView ID="lstCases" OnItemCommand="lstCases_ItemCommand" runat="server">
                                    <LayoutTemplate>
                                        <tbody>
                                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                        </tbody>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                <%# Eval("DoctorName")%>
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td class="grid-border-bottom">
                                                <%# Eval("AppointmentDate")%>
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td class="grid-border-bottom">
                                                <%# Eval("TimeFrom")%>
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td class="grid-border-bottom">
                                                <%# Eval("TimeTo")%>
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td class="grid-border-bottom">
                                                <%# Eval("LocationName")%>
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td class="grid-border-bottom">
                                                <%# Eval("CaseStatus")%>
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-border-bottom">
                                            </td>
                                            <td width="61" align="left" class="grid-border-bottom">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="9">
                                                            &nbsp;
                                                        </td>
                                                        <td width="16" align="left">
                                                            <asp:ImageButton ID="imgViewButton" CommandArgument='<%# Eval("caseID") %>' CommandName='ViewCase'  runat="server" ImageUrl="images/icon-view.png" />
                                                        </td>
                                                        <td width="16" align="left">
                                                            <a href="#">
                                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:ImageButton ID="imgDeleteButton" runat="server" ImageUrl="images/icon-delete.png"
                                                                            CommandName="popup" CommandArgument='<%# Eval("caseID") %>' />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </a>
                                                        </td>
                                                        <td align="left">
                                                            <a href="#"></a>
                                                        </td>
                                                        <td align="left" width="9">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr>
                                            <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                <%# Eval("DoctorName")%>
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td class="grid-bg-color grid-border-bottom">
                                                <%# Eval("AppointmentDate")%>
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td class="grid-bg-color grid-border-bottom">
                                                <%# Eval("TimeFrom")%>
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td class="grid-bg-color grid-border-bottom">
                                                <%# Eval("TimeTo")%>
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td class="grid-bg-color grid-border-bottom">
                                                <%# Eval("LocationName")%>
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td class="grid-bg-color grid-border-bottom">
                                                <%# Eval("CaseStatus")%>
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td width="1" bgcolor="#CCCCCC">
                                            </td>
                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                            </td>
                                            <td width="61" align="left" class=" grid-bg-color grid-border-bottom">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="9">
                                                            &nbsp;
                                                        </td>
                                                        <td width="16" align="left">
                                                            <a href="#">
                                                                <asp:ImageButton ID="imgViewButton0" CommandArgument='<%# Eval("caseID") %>' CommandName='ViewCase' runat="server" ImageUrl="images/icon-view.png" />
                                                            </a>
                                                        </td>
                                                        <td width="16" align="left">
                                                            <a href="#">
                                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:ImageButton ID="imgDeleteButton0" runat="server" ImageUrl="images/icon-delete.png"
                                                                            CommandName="popup" CommandArgument='<%# Eval("caseID") %>' />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </a>
                                                        </td>
                                                        <td align="left">
                                                            <a href="#"></a>
                                                        </td>
                                                        <td align="left" width="9">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
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
                                                        <asp:DataPager ID="dtpCases" Visible="true" PageSize="20" runat="server" PagedControlID="lstCases"
                                                            OnPreRender="dtpCases_PreRender">
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
    <asp:Button ID="btnForPopupModal" runat="server" Text="Button" Style="display: none;" />
    <asp:Panel ID="pnlDeleteAppointment" runat="server" Visible="false">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="background-color: #CACACA;
            border-width: thin; border-color: #C0C0C0; width: 300px; height: 200px;">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="Reason of Deleteion"></asp:Label><br />
                <asp:TextBox ID="txtDeletetionReson" runat="server" TextMode="MultiLine" Style="resize: none;"
                    Height="140" Width="250"></asp:TextBox><br />
                <asp:Button ID="btnDelete" runat="server" Text="Cancel Case" OnClick="btnDelete_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" Width="53px" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnForPopupModal"
        PopupControlID="UpdatePanel1">
    </cc1:ModalPopupExtender>
</asp:Content>
