<%@ page language="C#" title="" masterpagefile="~/ControlPanel/AdminPanel.master" autoeventwireup="true" inherits="ControlPanel_UpdateNewsFeeds, App_Web_zarixrtn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="968" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox">
                    <tr>
                        <td valign="top">
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
                                    <td valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                                                                                                    Alerts
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
                                                            <td height="5">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="form">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="700" valign="top">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="151" align="left">
                                                                                                    Alerts
                                                                                                </td>
                                                                                                <td align="left">
                                                                                                    <asp:DropDownList ID="ddlNewsFeeds" ClientIDMode="Static" runat="server" CssClass="field-220">
                                                                                                        <asp:ListItem Value="0">For ALL</asp:ListItem>
                                                                                                        <asp:ListItem Value="4">For Patient/Customers Only</asp:ListItem>
                                                                                                        <asp:ListItem Value="2">For Doctors Only</asp:ListItem>
                                                                                                        <asp:ListItem Value="3">For Pharmasist Only</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td height="3">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="151" align="left">
                                                                                                    Title:
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbTitle"
                                                                                                        ValidationGroup="validation" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td align="left">
                                                                                                    <asp:TextBox ID="tbTitle" class="field-220" runat="server"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td height="3">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="151" align="left" valign="top">
                                                                                                    Description:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                                                                        ControlToValidate="tbDescription" ValidationGroup="validation" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td align="left">
                                                                                                    <asp:TextBox ID="tbDescription" class="field-220" Rows="5" Style="resize: none;"
                                                                                                        TextMode="MultiLine" runat="server"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td height="3">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="151" align="left">
                                                                                                    Upload Image:
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1"
                                                                                                        ValidationGroup="validation" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td align="left">
                                                                                                    <asp:FileUpload ID="FileUpload1" class="field-220" runat="server" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2" style="text-align: left">
                                                                                                    <asp:Label ID="Label4" runat="server" Text="."></asp:Label>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="text-align: left">
                                                                                                </td>
                                                                                                <td align="left">
                                                                                                    <asp:Image ID="imgEventImage" ImageUrl="#" Width="100px" Height="100px" runat="server" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td height="3">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="151" align="left">
                                                                                                    Posting Date
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                                                                                                        ControlToValidate="txtPostingDate" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td align="left">
                                                                                                    <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtPostingDate" runat="server">
                                                                                                    </cc1:CalendarExtender>
                                                                                                    <asp:TextBox ID="txtPostingDate" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="15">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="left" valign="top">
                                                                            <table width="500" border="0" cellspacing="0" cellpadding="0" class="mainbox">
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
                                                                                        <asp:ListView ID="lstDocuments" runat="server" OnPreRender="lstDocuments_PreRender"
                                                                                            OnItemCommand="lstDocuments_ItemCommand">
                                                                                            <LayoutTemplate>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td height="30" width="15" class="grid-header">
                                                                                                        </td>
                                                                                                        <td width="100" align="left" class="grid-header">
                                                                                                            News Title
                                                                                                        </td>
                                                                                                        <td width="5" class="grid-header">
                                                                                                        </td>
                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                        </td>
                                                                                                        <td width="5" class="grid-header">
                                                                                                        </td>
                                                                                                        <td width="265" align="left" class="grid-header">
                                                                                                            News Decription
                                                                                                        </td>
                                                                                                        <td width="5" class="grid-header">
                                                                                                        </td>
                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                        </td>
                                                                                                        <td width="5" class="grid-header">
                                                                                                        </td>
                                                                                                        <td width="150" align="left" class="grid-header">
                                                                                                            Posting Date
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
                                                                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                                                                    <ContentTemplate>
                                                                                                        <tr>
                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                            </td>
                                                                                                            <td width="100" height="30" align="left" class="grid-bg-color grid-border-bottom">
                                                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("sNewsTitle")%>'></asp:Label>
                                                                                                            </td>
                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                            </td>
                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                            </td>
                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                            </td>
                                                                                                            <td width="265" align="left" class="grid-bg-color grid-border-bottom">
                                                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("sNewsDescription") %>'></asp:Label>
                                                                                                            </td>
                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                            </td>
                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                            </td>
                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                            </td>
                                                                                                            <td width="150" align="left" class="grid-bg-color grid-border-bottom">
                                                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("dtPostingDate") %>'></asp:Label>
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
                                                                                                                            <asp:ImageButton ID="btnDeleteDocument" runat="server" src="images/icon-delete.png"
                                                                                                                                Width="9" Height="10" CommandArgument='<%# Eval("iNewsID")%>' CommandName="deleteDocument" />
                                                                                                                        </td>
                                                                                                                        <td align="left">
                                                                                                                            <asp:ImageButton ID="btnEditDocument" runat="server" src="images/icon-view-edit.png"
                                                                                                                                Width="9" Height="10" CommandArgument='<%# Eval("iNewsID")%>' CommandName="editDocument" />
                                                                                                                        </td>
                                                                                                                        <td align="left" width="9">
                                                                                                                            &nbsp;
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                            </ItemTemplate>
                                                                                        </asp:ListView>
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td width="5" height="5">
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:DataPager ID="dtpDocument" Visible="true" PageSize="10" runat="server" PagedControlID="lstDocuments">
                                                                                            <Fields>
                                                                                                <asp:NextPreviousPagerField ButtonCssClass="grid_pagi_bg_a1" FirstPageText="First"
                                                                                                    NextPageText="" PreviousPageText="« Previous" />
                                                                                                <asp:NumericPagerField NumericButtonCssClass="grid_pagi_bg_a2" />
                                                                                                <asp:NextPreviousPagerField ButtonCssClass="grid_pagi_bg_a1" LastPageText="Last"
                                                                                                    NextPageText="Next »" PreviousPageText="" />
                                                                                            </Fields>
                                                                                        </asp:DataPager>
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
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:HiddenField ID="idiUserID" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
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
    </td> </tr>
    <tr>
        <td class="paging">
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
                        <table width="197" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="63" align="left">
                                    <asp:ImageButton ID="btnSave" src="images/btn-save.png" Width="63" Height="25" runat="server"
                                        ValidationGroup="validation" OnClick="btnSave_Click" />
                                </td>
                                <td align="left">
                                    &nbsp;
                                </td>
                                
                                <td align="left">
                                    &nbsp;
                                </td>
                                <td width="63" align="left">
                                    <asp:ImageButton ID="btnCancel" src="images/btn-cancel.png" Width="63" Height="25"
                                        runat="server" onclick="btnCancel_Click" />
                                </td>
                            </tr>
                        </table>
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
</asp:Content>
