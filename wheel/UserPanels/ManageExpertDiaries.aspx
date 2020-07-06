<%@ page title="" language="C#" masterpagefile="~/UserPanels/UserPanel.master" autoeventwireup="true" inherits="UserPanels_Default, App_Web_2fwj3ljd" maintainscrollpositiononpostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="EventCalendar" Namespace="ExtendedControls" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.filter_input.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function fnAddMore() {
            $("#btnAddMore").attr("style", "display:none");
            $("#trMoreSlots").attr("style", "display:block");
            $("#btnAddSingle").attr("style", "display:block");
            document.getElementById("<%= hfAddmore.ClientID %>").value = "1";

            //            btnAddMore fnAddMore btnAddSingle fnAddSingle
        }
        function fnAddSingle() {
            $("#btnAddMore").attr("style", "display:block");
            $("#trMoreSlots").attr("style", "display:none");
            $("#btnAddSingle").attr("style", "display:none");
            document.getElementById("<%= hfAddmore.ClientID %>").value = "0";
        }
                
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="968" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table width="968" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 484px; vertical-align: top;">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <cc1:EventCalendar ID="calAppointment" ClientIDMode="Static" ToolTip="Appointment Schedule"
                                                    runat="server" BorderWidth="1px" Font-Names="Arial" Font-Size="9pt" Width="400px"
                                                    FirstDayOfWeek="Monday" NextMonthText="►" PrevMonthText="◄" ShowGridLines="True"
                                                    ShowDescriptionAsToolTip="True" CellPadding="0" Font-Bold="False" TitleStyle-CssClass="ClanderHeader"
                                                    DayHeaderStyle-CssClass="CalenderDayHeader" OnDayRender="calAppointment_DayRender"
                                                    OnSelectionChanged="calAppointment_SelectionChanged">
                                                    <SelectedDayStyle BackColor="#1781E8" CssClass="CalenderSelectedDay" />
                                                    <SelectorStyle BackColor="#1781E8" />
                                                    <TodayDayStyle Wrap="True" CssClass="CalenderTodayDay" />
                                                    <OtherMonthDayStyle CssClass="CalenderOtherDays" />
                                                    <DayStyle CssClass="ClanderCurrentDays" />
                                                    <NextPrevStyle ForeColor="White" CssClass="ClanderNextPrevMonth" />
                                                    <DayHeaderStyle Font-Bold="False" Wrap="True" />
                                                    <TitleStyle Font-Bold="False" Height="26px" />
                                                </cc1:EventCalendar>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 484px; vertical-align: top;">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="left">
                                                <table>
                                                    <tr>
                                                        <td style="width: 80px; text-align: left; vertical-align: top;">
                                                            <asp:Button ID="btnAddSlots" runat="server" CssClass="gbtn_s" OnClick="btnAddSlots_Click"
                                                                Text="Add Slots" Visible="false" CausesValidation="false" />
                                                        </td>
                                                        <td style="width: 50px; text-align: left; vertical-align: top;">
                                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" EnableViewState="true">
                                                                <ProgressTemplate>
                                                                    <img alt="Loading" src="images/Loading.gif" width="30px" height="20px" /></ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblFormMessages" runat="server" Text="-" Visible="false"></asp:Label>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5" style="background: url(images/appointment-box-left-top-crn.png); background-repeat: no-repeat;
                                                                        height: 30px;">
                                                                    </td>
                                                                    <td width="474" class="appointment-box-header" align="left">
                                                                        <asp:Label ID="lblCurrentDate" runat="server" Text="Label" CssClass="H1" ForeColor="White"
                                                                            Font-Size="14px"></asp:Label>
                                                                    </td>
                                                                    <td width="5" style="background: url(images/appointment-box-right-top-crn.png); background-repeat: no-repeat;
                                                                        height: 30px;">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="appointment-box-border">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="5px" height="8">
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td width="5px">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                <thead>
                                                                    <tr>
                                                                        <td style="width: 84px; height: 20px; padding-left: 5px; text-align: center;" class="grid-header">
                                                                            Time
                                                                        </td>
                                                                        <td width="150px" align="left" class="grid-header">
                                                                            Expert Name
                                                                        </td>
                                                                        <td width="150px" align="left" class="grid-header">
                                                                            Location
                                                                        </td>
                                                                        <td width="100px" align="center" class="grid-header">
                                                                            Action
                                                                        </td>
                                                                    </tr>
                                                                </thead>
                                                                <asp:ListView ID="lstAvailableSlots" runat="server" OnItemDataBound="lstAvailableSlots_ItemDataBound"
                                                                    OnItemCommand="lstAvailableSlots_ItemCommand">
                                                                    <LayoutTemplate>
                                                                        <tbody>
                                                                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                        </tbody>
                                                                    </LayoutTemplate>
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td align="center" colspan="4" style="height: 3px" class="grid-border-bottom">
                                                                            </td>
                                                                        </tr>
                                                                        <tr id="trAppointment" runat="server">
                                                                            <td align="center" class="grid-bg-color grid-border-bottom">
                                                                                <span title='<%# Eval("sTimeFrom")%> - <%# Eval("sTimeTo")%>'>
                                                                                    <%# Eval("sTimeFrom")%>
                                                                                </span>
                                                                            </td>
                                                                            <td align="left" class="grid-bg-color grid-border-bottom">
                                                                                <span title='<%# Eval("sDoctorName")%>'>
                                                                                    <%# Eval("sDoctorName")%>
                                                                                </span>
                                                                            </td>
                                                                            <td align="left" class="grid-bg-color grid-border-bottom">
                                                                                <span title=' <%# Eval("sLocationName")%>'>
                                                                                    <%# Eval("sLocationName")%>
                                                                                </span>
                                                                            </td>
                                                                            <td align="center" class="grid-bg-color grid-border-bottom">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:ImageButton ID="imgBtnDelete" runat="server" ToolTip="Delete Appointment" AlternateText="Delete"
                                                                                                ImageUrl="images/trash.png" Width="15px" Height="15px" CausesValidation="false"
                                                                                                CommandArgument='<%# Eval("iAppointmentID") %>' CommandName="DeleteApppointment"
                                                                                                OnClientClick='javascript:return confirm("Do you want to Delete this Appointment");' />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="lblReserved" runat="server" Text="-" Visible="false"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:ImageButton ID="imgBtnMove" runat="server" ToolTip="Move Appointment" AlternateText="Delete"
                                                                                                ImageUrl="images/move_Icon.png" Width="15px" Height="15px" CausesValidation="false"
                                                                                                CommandArgument='<%# Eval("iAppointmentID") %>' CommandName="MoveApppointment" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:ImageButton ID="imgBtnBookAppointment" runat="server" ToolTip="Book Appointment"
                                                                                                AlternateText="Delete" ImageUrl="images/appt-icon.png" Width="15px" Height="15px"
                                                                                                CausesValidation="false" CommandArgument='<%# Eval("iAppointmentID") %>' CommandName="BookApppointment" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                    <EmptyDataTemplate>
                                                                        <tr>
                                                                            <td colspan="4">
                                                                                No Appointment Slot Exists on this date
                                                                            </td>
                                                                        </tr>
                                                                    </EmptyDataTemplate>
                                                                </asp:ListView>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="5px" height="8">
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td width="5px">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnPopUP" runat="server" Text="POPUP" Style="display: none;" />
                                                <asp:HyperLink ID="HyperLink1" runat="server" Style="display: none;">HyperLink</asp:HyperLink>
                                                <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground"
                                                    CancelControlID="btnCloseSlot" DropShadow="false" PopupControlID="pnlNotes" TargetControlID="HyperLink1">
                                                </asp:ModalPopupExtender>
                                                <asp:Panel ID="pnlNotes" runat="server" Style="display: none;" Width="350px" Height="360px">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td class="panel_style">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td class="inner_hd1">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td>
                                                                                        Appointment Slots for
                                                                                        <asp:Label ID="lblSelectedDate" runat="server" Text="Monday, 31 March 2013"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="new_input_field_contnr">
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td style="width: 140px">
                                                                                                    Select Expert:
                                                                                                </td>
                                                                                                <td colspan="5">
                                                                                                    <asp:DropDownList ID="ddlMedicalExperts" CssClass="field-220" Width="160px" runat="server"
                                                                                                        AutoPostBack="True" OnSelectedIndexChanged="ddlMedicalExperts_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="width: 140px">
                                                                                                    Time :<asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="-1"
                                                                                                        ControlToValidate="ddlHours" runat="server" Text="*" ForeColor="Maroon" ToolTip="Select Hours"
                                                                                                        ValidationGroup="validateSlots" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Maroon" ToolTip="Select Minuts"
                                                                                                        InitialValue="-1" ControlToValidate="ddlMinuts" runat="server" Text="*" ValidationGroup="validateSlots"
                                                                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlHours" CssClass="field-220" Width="50px" runat="server">
                                                                                                        <asp:ListItem Value="-1" Text="HH"></asp:ListItem>
                                                                                                        <asp:ListItem Value="01" Text="01"></asp:ListItem>
                                                                                                        <asp:ListItem Value="02" Text="02"></asp:ListItem>
                                                                                                        <asp:ListItem Value="03" Text="03"></asp:ListItem>
                                                                                                        <asp:ListItem Value="04" Text="04"></asp:ListItem>
                                                                                                        <asp:ListItem Value="05" Text="05"></asp:ListItem>
                                                                                                        <asp:ListItem Value="06" Text="06"></asp:ListItem>
                                                                                                        <asp:ListItem Value="07" Text="07"></asp:ListItem>
                                                                                                        <asp:ListItem Value="08" Text="08"></asp:ListItem>
                                                                                                        <asp:ListItem Value="09" Text="09"></asp:ListItem>
                                                                                                        <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                                                                                        <asp:ListItem Value="11" Text="11"></asp:ListItem>
                                                                                                        <asp:ListItem Value="12" Text="12"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                                <td align="center">
                                                                                                    :
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlMinuts" CssClass="field-220" Width="50px" runat="server">
                                                                                                        <asp:ListItem Value="-1" Text="MM"></asp:ListItem>
                                                                                                        <asp:ListItem Value="00" Text="00"></asp:ListItem>
                                                                                                        <asp:ListItem Value="05" Text="05"></asp:ListItem>
                                                                                                        <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                                                                                        <asp:ListItem Value="15" Text="15"></asp:ListItem>
                                                                                                        <asp:ListItem Value="20" Text="20"></asp:ListItem>
                                                                                                        <asp:ListItem Value="25" Text="25"></asp:ListItem>
                                                                                                        <asp:ListItem Value="30" Text="30"></asp:ListItem>
                                                                                                        <asp:ListItem Value="35" Text="35"></asp:ListItem>
                                                                                                        <asp:ListItem Value="40" Text="40"></asp:ListItem>
                                                                                                        <asp:ListItem Value="45" Text="45"></asp:ListItem>
                                                                                                        <asp:ListItem Value="50" Text="50"></asp:ListItem>
                                                                                                        <asp:ListItem Value="55" Text="55"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                                <td align="center">
                                                                                                    -
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlDayPart" CssClass="field-220" Width="45px" runat="server">
                                                                                                        <asp:ListItem Value="AM" Text="AM"></asp:ListItem>
                                                                                                        <asp:ListItem Value="PM" Text="PM"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="width: 140px">
                                                                                        Location:
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlLocation"
                                                                                            InitialValue="-1" runat="server" ErrorMessage="*" ValidationGroup="validateSlots"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="ddlLocation" CssClass="field-220" Width="160px" runat="server">
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="width: 140px">
                                                                                        <input id="btnAddMore" type="button" value="Add Multiple" class="default_button_3"
                                                                                            onclick="fnAddMore()" />
                                                                                        <input id="btnAddSingle" type="button" value="Add Single" style="display: none;"
                                                                                            class="gbtn_s" onclick="fnAddSingle()" />
                                                                                        <%--<asp:Button ID="btnAddMore" runat="server" CssClass="gbtn_s" Text="Add More" OnClientClick="javascript:fnAddMore();" />&nbsp;
                                                                                        <asp:Button ID="btnAddSingle" runat="server" CssClass="gbtn_s" Text="Add Single" style
                                                                                            OnClientClick="javascript:fnAddSingle();" />--%>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:HiddenField ID="hfAddmore" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <table width="100%" id="trMoreSlots" style="display: none" border="0" cellspacing="0"
                                                                                            cellpadding="0">
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="width: 140px">
                                                                                                    Number to Add:<asp:Label ID="lblAddNumber" Visible="false" ForeColor="Maroon" runat="server"
                                                                                                        Text="*"></asp:Label>
                                                                                                    <asp:MaskedEditExtender ID="MaskedEditExtender1" TargetControlID="txtNumberToAdd"
                                                                                                        MaskType="Number" MessageValidatorTip="true" Mask="99" runat="server">
                                                                                                    </asp:MaskedEditExtender>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtNumberToAdd" ClientIDMode="Static" CssClass="field-220" Width="80px"
                                                                                                        runat="server"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="width: 140px">
                                                                                                    Each Every:
                                                                                                </td>
                                                                                                <td>
                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                        <tr>
                                                                                                            <td style="width: 40%">
                                                                                                                <asp:DropDownList ID="ddlEveryMinut" CssClass="field-220" Width="50px" runat="server">
                                                                                                                    <asp:ListItem Value="05" Text="05"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="15" Text="15"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="20" Text="20"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="25" Text="25"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="30" Text="30"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="35" Text="35"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="40" Text="40"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="45" Text="45"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="50" Text="50"></asp:ListItem>
                                                                                                                    <asp:ListItem Value="55" Text="55"></asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                            <td style="width: 60%">
                                                                                                                &nbsp;minuts
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblError" runat="server" ForeColor="Maroon" Font-Size="11px" Font-Bold="true"
                                                                                            Visible="false" Text="Appointment Time is Collapsing"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        &nbsp;
                                                                                        <asp:Button ID="btnSaveSlot" CausesValidation="true" ValidationGroup="validateSlots"
                                                                                            runat="server" CssClass="gbtn_s" Text="Save" OnClick="btnSaveSlot_Click" />&nbsp;
                                                                                        <asp:Button ID="btnCloseSlot" runat="server" Text="Close" CssClass="gbtn_s" CausesValidation="false"
                                                                                            OnClick="btnCloseSlot_Click" />
                                                                                    </td>
                                                                                    <%--<td></td>--%>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <asp:HyperLink ID="HyperLink2" runat="server" Style="display: none;">HyperLink</asp:HyperLink>
                                                <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="modalBackground"
                                                    CancelControlID="btnCloseSlot" DropShadow="false" PopupControlID="pnlMoveAppointment"
                                                    TargetControlID="HyperLink2">
                                                </asp:ModalPopupExtender>
                                                <asp:Panel ID="pnlMoveAppointment" runat="server" Style="display: none;" Width="350px"
                                                    Height="360px">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td class="panel_style">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td class="inner_hd1">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td>
                                                                                        Appointment for
                                                                                        <asp:Label ID="lblAppointmentDate" runat="server" Text="Monday, 31 March 2013"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="new_input_field_contnr">
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td style="width: 140px">
                                                                                                    Select Date:
                                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ForeColor="Maroon"
                                                                                                        runat="server" ValidationGroup="validateMSlots" ControlToValidate="txtMoveToDate"
                                                                                                        Enabled="true" SetFocusOnError="true" ErrorMessage="*" ToolTip="* Invalid date Format e.g. MM/DD/YYYY"
                                                                                                        ValidationExpression="^((((0[13578])|([13578])|(1[02]))[\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\/](([1-9])|([0-2][0-9]))))[\/]\d{4}$|^\d{4}$"></asp:RegularExpressionValidator>
                                                                                                </td>
                                                                                                <td colspan="5">
                                                                                                    <asp:TextBox ID="txtMoveToDate" CssClass="field-220" runat="server"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtMoveToDate" Enabled="true"
                                                                                                        PopupPosition="BottomLeft" runat="server">
                                                                                                    </asp:CalendarExtender>
                                                                                                </td>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="width: 140px">
                                                                                                    Time :<asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="-1"
                                                                                                        ControlToValidate="ddlMoveHours" runat="server" Text="*" ForeColor="Maroon" ToolTip="Select Hours"
                                                                                                        ValidationGroup="validateMSlots" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Maroon" ToolTip="Select Minuts"
                                                                                                        InitialValue="-1" ControlToValidate="ddlMoveMinuts" runat="server" Text="*" ValidationGroup="validateMSlots"
                                                                                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlMoveHours" CssClass="field-220" Width="50px" runat="server">
                                                                                                        <asp:ListItem Value="-1" Text="HH"></asp:ListItem>
                                                                                                        <asp:ListItem Value="01" Text="01"></asp:ListItem>
                                                                                                        <asp:ListItem Value="02" Text="02"></asp:ListItem>
                                                                                                        <asp:ListItem Value="03" Text="03"></asp:ListItem>
                                                                                                        <asp:ListItem Value="04" Text="04"></asp:ListItem>
                                                                                                        <asp:ListItem Value="05" Text="05"></asp:ListItem>
                                                                                                        <asp:ListItem Value="06" Text="06"></asp:ListItem>
                                                                                                        <asp:ListItem Value="07" Text="07"></asp:ListItem>
                                                                                                        <asp:ListItem Value="08" Text="08"></asp:ListItem>
                                                                                                        <asp:ListItem Value="09" Text="09"></asp:ListItem>
                                                                                                        <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                                                                                        <asp:ListItem Value="11" Text="11"></asp:ListItem>
                                                                                                        <asp:ListItem Value="12" Text="12"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                                <td align="center">
                                                                                                    :
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlMoveMinuts" CssClass="field-220" Width="50px" runat="server">
                                                                                                        <asp:ListItem Value="-1" Text="MM"></asp:ListItem>
                                                                                                        <asp:ListItem Value="00" Text="00"></asp:ListItem>
                                                                                                        <asp:ListItem Value="05" Text="05"></asp:ListItem>
                                                                                                        <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                                                                                        <asp:ListItem Value="15" Text="15"></asp:ListItem>
                                                                                                        <asp:ListItem Value="20" Text="20"></asp:ListItem>
                                                                                                        <asp:ListItem Value="25" Text="25"></asp:ListItem>
                                                                                                        <asp:ListItem Value="30" Text="30"></asp:ListItem>
                                                                                                        <asp:ListItem Value="35" Text="35"></asp:ListItem>
                                                                                                        <asp:ListItem Value="40" Text="40"></asp:ListItem>
                                                                                                        <asp:ListItem Value="45" Text="45"></asp:ListItem>
                                                                                                        <asp:ListItem Value="50" Text="50"></asp:ListItem>
                                                                                                        <asp:ListItem Value="55" Text="55"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                                <td align="center">
                                                                                                    -
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlMoveDayPart" CssClass="field-220" Width="50px" runat="server">
                                                                                                        <asp:ListItem Value="AM" Text="AM"></asp:ListItem>
                                                                                                        <asp:ListItem Value="PM" Text="PM"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblMoveDateErro" runat="server" ForeColor="Maroon" Font-Size="11px"
                                                                                            Font-Bold="true" Visible="false" Text="Appointment Time is Collapsing"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        &nbsp;
                                                                                        <asp:Button ID="btnMoveAppointment" CausesValidation="true" ValidationGroup="validateMSlots"
                                                                                            runat="server" CssClass="gbtn_s" Text="Save" OnClick="btnSaveSlot_Click" />&nbsp;
                                                                                        <asp:Button ID="btnCloseMoveApp" runat="server" Text="Close" CssClass="gbtn_s" CausesValidation="false"
                                                                                            OnClick="btnCloseMoveApp_Click" />
                                                                                    </td>
                                                                                    <%--<td></td>--%>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <asp:HyperLink ID="HyperLink3" runat="server" Style="display: none;">HyperLink</asp:HyperLink>
                                                <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server" BackgroundCssClass="modalBackground"
                                                    CancelControlID="btnCancelBooking" DropShadow="false" PopupControlID="pnlBookAppointment"
                                                    TargetControlID="HyperLink3">
                                                </asp:ModalPopupExtender>
                                                <asp:Panel ID="pnlBookAppointment" runat="server" Style="display: none;" Width="420px">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td class="panel_style">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td class="inner_hd1">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td>
                                                                                        Case Booking for
                                                                                        <asp:Label ID="lblCaseBookingTitle" runat="server" Text="Monday, 31 March 2013 at 9:00 AM"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="new_input_field_contnr">
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td>
                                                                                        Doctor:
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblDoctorName" runat="server" Text="Dr. Durrel Marsh"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2" style="height: 3px;">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Case Ref No#:
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="Maroon" ControlToValidate="txtCaseRefNo"
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
                                                                                                </td>
                                                                                                <td>
                                                                                                    Status:
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlCaseStatus" runat="server" CssClass="field-220" Width="100px">
                                                                                                        <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                                                                                                        <asp:ListItem Value="Appointment Attended" Text="Appointment Attended"></asp:ListItem>
                                                                                                        <asp:ListItem Value="Appointment DNA" Text="Appointment DNA"></asp:ListItem>
                                                                                                        <asp:ListItem Value="Closed" Text="Closed"></asp:ListItem>
                                                                                                        <asp:ListItem Value="Canceled" Text="Canceled"></asp:ListItem>
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
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="ddlPatientGender" runat="server" CssClass="field-220" Width="100px">
                                                                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                                                                            <asp:ListItem Value="Female">Female</asp:ListItem>
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
                                                                                        <asp:Button ID="btnBookCase" CausesValidation="true" runat="server" CssClass="gbtn_s"
                                                                                            Text="Book Case" ValidationGroup="validateCaseDetials" OnClick="btnBookCase_Click" />&nbsp;
                                                                                        <asp:Button ID="btnCancelBooking" runat="server" Text="Cancel" CssClass="gbtn_s"
                                                                                            CausesValidation="false" OnClick="btnCancelBooking_Click" />
                                                                                    </td>
                                                                                    <%--<td></td>--%>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

