<%@ page title="" language="C#" masterpagefile="~/UserPanels/Doctor.master" autoeventwireup="true" inherits="UserPanels_Default, App_Web_iiwsqckp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
   <table width="968" border="0" cellspacing="0" cellpadding="0" class="mainbox">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="5" height="5">
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
                                                                            Schedule Appointment
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
                                    <td height="3px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grid">
                                        <asp:ListView ID="lstscheduleApp" runat="server" OnItemCommand="lstscheduleApp_ItemCommand">
                                            <LayoutTemplate>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="5" height="30" class="grid-header">
                                                        </td>
                                                        <td width="232" align="left" class="grid-header">
                                                            Patient Name
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="162" align="left" class="grid-header">
                                                            Doctor Name
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="262" align="left" class="grid-header">
                                                            Appoitment Date/Time
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="150" align="left" class="grid-header">
                                                            Venue
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
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                    </tr>
                                                    <tr id="ItemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td width="5" height="30" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="232" align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsPatientName" title='<%# Eval("sPatientName") %>'>
                                                            <%# Eval("sPatientName")%>
                                                        </span>
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="1" bgcolor="#CCCCCC">
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="183" align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsDoctorName" title='<%# Eval("sDoctorName") %>'>
                                                            <%# Eval("sDoctorName")%></span>
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="1" bgcolor="#CCCCCC">
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="162" align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsAppoimentTimeFromTimeTo" title='<%# Eval("sAppoimentTimeFromTimeTo") %>'>
                                                            <%# Eval("sAppoimentTimeFromTimeTo")%></span>
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="1" bgcolor="#CCCCCC">
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="150" align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsLocationName" title='<%# Eval("sLocationName") %>'>
                                                            <%# Eval("sLocationName")%></span>
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="1" bgcolor="#CCCCCC">
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="103" align="left" class="grid-bg-color grid-border-bottom">
                                                        <span id="idsCaseStatus" title='<%# Eval("sCaseStatus") %>'>
                                                            <%# Eval("sCaseStatus")%></span>
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="1" bgcolor="#CCCCCC">
                                                    </td>
                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                    </td>
                                                    <td width="61" align="left" class="grid-bg-color grid-border-bottom">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="9">
                                                                    &nbsp;
                                                                </td>
                                                                <td width="16" align="left">
                                                                    <%--  <a href="#">
                                                            <img src="images/icon-view.png" width="10" height="10" /></a>--%>
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" CommandArgument='<%# Eval("iCaseID")%>'
                                                                        CommandName="ViewCase" Height="10px" ImageUrl="images/icon-view.png" Width="9px" />
                                                                </td>
                                                                <td width="16" align="left">
                                                                    <a href="#">
                                                                        <img src="images/icon-delete.png" width="9" height="10" /></a>
                                                                </td>
                                                                <td align="left">
                                                                    <a href="#">
                                                                        <img src="images/icon-view-edit.png" width="9" height="10" /></a>
                                                                </td>
                                                                <td align="left" width="9">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="5">
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <AlternatingItemTemplate>
                                                <tr>
                                                    <td width="5" height="30" class="grid-border-bottom">
                                                    </td>
                                                    <td width="232" align="left" class="grid-border-bottom">
                                                        <span id="idsPatientName" title='<%# Eval("sPatientName") %>'>
                                                            <%# Eval("sPatientName")%>
                                                        </span>
                                                    </td>
                                                    <td width="5" class="grid-border-bottom">
                                                    </td>
                                                    <td width="1" bgcolor="#CCCCCC">
                                                    </td>
                                                    <td width="5" class="grid-border-bottom">
                                                    </td>
                                                    <td width="183" align="left" class="grid-border-bottom">
                                                        <span id="idsDoctorName" title='<%# Eval("sDoctorName") %>'>
                                                            <%# Eval("sDoctorName")%></span>
                                                    </td>
                                                    <td width="5" class="grid-border-bottom">
                                                    </td>
                                                    <td width="1" bgcolor="#CCCCCC">
                                                    </td>
                                                    <td width="5" class="grid-border-bottom">
                                                    </td>
                                                    <td width="162" align="left" class="grid-border-bottom">
                                                        <span id="idsAppoimentTimeFromTimeTo" title='<%# Eval("sAppoimentTimeFromTimeTo") %>'>
                                                            <%# Eval("sAppoimentTimeFromTimeTo")%></span>
                                                    </td>
                                                    <td width="5" class="grid-border-bottom">
                                                    </td>
                                                    <td width="1" bgcolor="#CCCCCC">
                                                    </td>
                                                    <td width="5" class="grid-border-bottom">
                                                    </td>
                                                    <td width="150" align="left" class="grid-border-bottom">
                                                        <span id="idsLocationName" title='<%# Eval("sLocationName") %>'>
                                                            <%# Eval("sLocationName")%></span>
                                                    </td>
                                                    <td width="5" class="grid-border-bottom">
                                                    </td>
                                                    <td width="1" bgcolor="#CCCCCC">
                                                    </td>
                                                    <td width="5" class="grid-border-bottom">
                                                    </td>
                                                    <td width="103" align="left" class="grid-border-bottom">
                                                        <span id="idsCaseStatus" title='<%# Eval("sCaseStatus") %>'>
                                                            <%# Eval("sCaseStatus")%></span>
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
                                                                    <%-- <a href="#">
                                                            <img src="images/icon-view.png" width="10" height="10" /></a>--%>
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" CommandArgument='<%# Eval("iCaseID")%>'
                                                                        CommandName="ViewCase" Height="10px" ImageUrl="images/icon-view.png" Width="9px" />
                                                                </td>
                                                                <td width="16" align="left">
                                                                    <a href="#">
                                                                        <img src="images/icon-delete.png" width="9" height="10" /></a>
                                                                </td>
                                                                <td align="left">
                                                                    <a href="#">
                                                                        <img src="images/icon-view-edit.png" width="9" height="10" /></a>
                                                                </td>
                                                                <td align="left" width="9">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="5">
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
                                                <td height="30">
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
                                                                <asp:DataPager ID="DataPager1" runat="server" OnPreRender="dtpscheduleApp_PreRender"
                                                                    PagedControlID="lstscheduleApp" PageSize="20" Visible="true">
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
                </table>
            </td>
        </tr>
        <tr>
            <td height="15px">
            </td>
        </tr>
    </table>
                                               
</asp:Content>

