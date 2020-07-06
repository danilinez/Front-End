<%@ page title="" language="C#" masterpagefile="~/UserPanels/Client.master" autoeventwireup="true" inherits="UserPanels_Default, App_Web_bnu1tb1z" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript">

        $(window).load(function () {
            HideLabel();
        });

        function HideLabel() {
            document.getElementById('<%= lblSuccessMessage.ClientID %>').style.display = "none";
            setInterval(HideLabel(), 5000);
            
        }
        setTimeout("HideLabel();", 5000);

        function fnUpdateProfile() {

            var iUserID = document.getElementById("hfUserID").value;

            var iAdminCompanyID = document.getElementById("hfAdminCompanyID").value;

            var e = document.getElementById("ddlUserType");
            var iUserTypeID = e.options[e.selectedIndex].value;


            var txtName = document.getElementById("txtName").value;
            var txtEmail = document.getElementById("txtEmail");
            var txtUsername = document.getElementById("txtUsername").value;
            var txtPassword = document.getElementById("txtPassword").value;

            // company

            var txtCompanyName = document.getElementById("txtCompanyName");

            var txtCompanyEmail = document.getElementById("txtCompanyEmail");
            var txtAddress = document.getElementById("txtAddress").value;
            var txtPostCode = document.getElementById("txtPostCode").value;


            if (txtName.length < 1) {
                txtName.focus();

                return;
            }
            if (txtCompanyName.value.length < 1) {
                txtCompanyName.focus();

                return;
            }

            if (txtCompanyEmail.value.length < 1) {
                txtCompanyEmail.focus();

                return;
            }

            if (txtUsername.length < 1) {
                txtUsername.focus();

                return;
            }
            if (txtPassword.length < 1) {
                txtPassword.focus();

                return;
            }

            var check = txtEmail.value.indexOf('@', 0)

            // alert('txtComments:' + txtComments.value);
            if (parseInt(check) < 0) {
                txtEmail.focus();
                alert('Invalid email address format\nPlease provide a valid email address.');
                return;
            }

            var check2 = txtEmail.value.indexOf('.', 0)

            if (parseInt(check2) < 0) {
                txtEmail.focus();
                alert('Invalid email address\nEmail address can be like -> example@example.com');

                return;
            }

            var check1 = txtCompanyEmail.value.indexOf('@', 0)

            // alert('txtComments:' + txtComments.value);
            if (parseInt(check1) < 0) {
                txtCompanyEmail.focus();
                alert('Invalid email address format\nPlease provide a valid email address.');
                return;
            }

            var check3 = txtCompanyEmail.value.indexOf('.', 0)

            if (parseInt(check3) < 0) {
                txtCompanyEmail.focus();
                alert('Invalid email address\nEmail address can be like -> example@example.com');

                return;
            }


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnUpdateAdminProfile",
                data: "{sUserID:'" + iUserID + "', sUserType:'" + iUserTypeID + "', sName:'" + txtName + "', sEmail:'" + txtEmail.value + "', sUserName:'" + txtUsername + "', sPassword:'" + txtPassword + "', sAdminCompanyID:'" + iAdminCompanyID + "', sCompanyName:'" + txtCompanyName.value + "', sCompanyEmail:'" + txtCompanyEmail.value + "', sCompanyAddress:'" + txtAddress + "', sPostCode:'" + txtPostCode + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {
                    var result = response.d;
                    if (result == 1) {
                        //alert("Profile Updated");
                        document.getElementById('<%= lblSuccessMessage.ClientID %>').style.display = "block";

                        //var lblSuccessMessage = document.getElementById("lblSuccessMessage");
                        //lblSuccessMessage.innerHTML = "Profile Updated";
                        //imdocument.getElementById('<%= lblSuccessMessage.ClientID %>').style.display = "block";

                        var lblSuccessMessage = document.getElementById("lblSuccessMessage");
                        lblSuccessMessage.innerHTML = "Profile Updated";
                                       
                        
                    
                    }
                    else if (result == 2) // Username Exists
                    {



                        //                        document.getElementById('<%= lblSuccessMessage.ClientID %>').style.display = "block";

                        var lblSuccessMessage = document.getElementById("lblSuccessMessage");
                        lblSuccessMessage.innerHTML = "username already taken";
                        lblSuccessMessage.style.color = "#f65618";
                        //                        alert('username already taken');
                    }
                    else if (result == 3) // Company Exists
                    {
                        alert('Company already exists with same name!');
                    }
                    else if (result == 4) {
                        alert('There is some propblem in Updating Company Details');
                    }
                    else if (result == 0) {
                        alert('There is some propblem in Updating records');
                    }
                },
                failure: function (msg) {
                    alert(msg);
                }
            });
            return false;

        }
    </script>
    <table width="968" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="968" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="956" align="left" valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <asp:HiddenField ID="hfUserID" ClientIDMode="Static" runat="server" />
                                        &nbsp;<asp:HiddenField ID="hfAdminCompanyID" runat="server" ClientIDMode="Static" />
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
                                                                                                                My Profile
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
                                                                                    <td style="width: 50%; vertical-align: top;">
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td colspan="2" style="text-align: left;">
                                                                                                    <span style="font-weight: bold; font-size: 11px; color: #606368;">Personal Details</span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2" style="text-align: left;">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    User Type:
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                                                                                        Display="None" ControlToValidate="ddlUserType" InitialValue="-1" Text="*" ValidationGroup="validateProfile"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlUserType" ClientIDMode="Static" CssClass="field-220" runat="server">
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Name:
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                                                                                        Display="None" ControlToValidate="txtName" Text="*" ValidationGroup="validateProfile"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input name="textfield2" clientidmode="Static" runat="server" type="text" class="validate[required] field-220"
                                                                                                        id="txtName" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Email:<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                                                        ErrorMessage="*" Text="*" Display="None" ControlToValidate="txtEmail" ValidationGroup="validateProfile"
                                                                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtEmail" ClientIDMode="Static" CssClass="validate[custom[email]] field-220"
                                                                                                        runat="server"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Username:
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                                                                                        ControlToValidate="txtName" Text="*" ValidationGroup="validateProfile"></asp:RequiredFieldValidator>
                                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*"
                                                                                                        Text="*" ControlToValidate="txtUsername" ValidationGroup="validateProfile" ValidationExpression="^[0-9a-zA-Z]+$"></asp:RegularExpressionValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtUsername" ClientIDMode="Static" CssClass="validate[required,custom[onlyLetterNumber]] field-220"
                                                                                                        runat="server"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Password:
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                                                                                        Display="None" ControlToValidate="txtPassword" Text="*" ValidationGroup="validateProfile"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtPassword" ClientIDMode="Static" CssClass="validate[required] field-220"
                                                                                                        runat="server"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                                                        <tr>
                                                                                                            <td width="50" align="left">
                                                                                                                <img alt="Save" src="images/btn-save.png" style="cursor: pointer;" onclick="fnUpdateProfile()"/>
                                                                                                                <%--<asp:ImageButton ID="lnkbSave" runat="server" ImageUrl="images/btn-save.png" CausesValidation="true"
                                                                    ValidationGroup="validateProfile" ClientIDMode="Static" />--%>
                                                                                                            </td>
                                                                                                            <td width="50" align="left">
                                                                                                                <asp:ImageButton ID="lnkbCancel" runat="server" ImageUrl="images/btn-cancel.png"
                                                                                                                    CausesValidation="false" ValidationGroup="validateProfile" OnClick="lnkbCancel_Click" />
                                                                                                            </td>
                                                                                                            <td width="150" align="left">
                                                                                                                <asp:Label ID="lblSuccessMessage" ClientIDMode="Static" ForeColor="DarkGreen" Font-Bold="true"
                                                                                                                    Font-Size="11px" runat="server" Text="" Width="120px" ></asp:Label>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td style="width: 50%; vertical-align: top;">
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td colspan="2" style="text-align: left;">
                                                                                                    <span style="font-weight: bold; font-size: 11px; color: #606368;">Company Details</span>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Company Name
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                                                                                        Display="None" ControlToValidate="txtCompanyName" Text="*" ValidationGroup="validateProfile"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input name="textfield2" clientidmode="Static" runat="server" type="text" class="validate[required] field-220"
                                                                                                        id="txtCompanyName" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Email
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                                                                                        ControlToValidate="txtCompanyEmail" Text="*" ValidationGroup="validateProfile"></asp:RequiredFieldValidator>
                                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*"
                                                                                                        Text="*" Display="None" ControlToValidate="txtCompanyEmail" ValidationGroup="validateProfile"
                                                                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input name="textfield2" clientidmode="Static" runat="server" type="text" class="validate[required] field-220"
                                                                                                        id="txtCompanyEmail" />
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
                                                                                                <td style="vertical-align: top;">
                                                                                                    Address
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtAddress" ClientIDMode="Static" CssClass="field-220" TextMode="MultiLine" Height="63px"
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
                                                                                                <td>
                                                                                                    Post Code
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input name="textfield2" clientidmode="Static" runat="server" type="text" class="field-220"
                                                                                                        id="txtPostCode" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
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
                                        </table>
                                    </td>
                                </tr>
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
                    <tr>
                        <td align="left" valign="top">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <%--<table width="968" border="0" align="center" cellpadding="0" cellspacing="0" class="mainbox">
        <tr>
            <td>My Specialities</td>
        </tr>
        <tr>
            <td>
                Enter your spaciality :
            </td>
            <td>
                <asp:TextBox ID="tbSpecialities" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnSaveSpecialities" runat="server" Text="Save" 
                    onclick="btnSaveSpecialities_Click"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="lstSpecialities" runat="server" onitemcommand="lstSpecialities_ItemCommand">
                    <LayoutTemplate>
                        <table ID="Table1" runat="server">
                            <tr>
                                <td>Specialities</td>
                                <td>Action</td>
                            </tr>
                            <tr id="ItemPlaceholder" runat="server"></tr>
                        </table>    
                    </LayoutTemplate>
                    <ItemTemplate>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table ID="Table2" runat="server">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("sTitle")%>' ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnEditSpecialities" runat="server" Text="Edit" CommandArgument='<%# Eval("iSpecialityID")%>' CommandName="editSpaciality" />
                                            <asp:Button ID="btnDeleteSpecialities" runat="server" Text="Delete" CommandArgument='<%# Eval("iSpecialityID")%>' CommandName="deleteSpaciality"/>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnEditSpecialities"/>
                                <asp:PostBackTrigger ControlID="btnDeleteSpecialities"  />
                            </Triggers>
                        </asp:UpdatePanel>
                    </ItemTemplate>
                </asp:ListView>
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstSpecialities" 
                    onprerender="DataPager1_PreRender">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link"/>
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Link" />
                    </Fields>
                </asp:DataPager> 
            </td>
        </tr>    
    </table>--%>


    <table width="568" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="15px">
            </td>
        </tr>
        <tr>
            <td class="mainbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox">
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="5" height="5">
                                    </td>
                                </tr>
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
                                                                                        My Specialities
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
                                                <td height="5px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <%-- <td height="3px">--%>
                                                <td height="5" align="right">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td style="font-size:11px ; color: #606368;">
                                                                Enter your spaciality :
                                                                <asp:TextBox ID="tbSpecialities" runat="server" class="field-220"></asp:TextBox>
                                                                
                                                            </td>
                                                            <td width="5">
                                                                
                                                            </td>
                                                            <td width="95" align="left">
                                                                <asp:Button ID="btnSaveSpecialities" runat="server" Text="Add Spaciality"  
                                                                onclick="btnSaveSpecialities_Click" class="default_button_3"/>
                                                            </td>
                                                            <td width="5">
                                                                &nbsp;
                                                            </td>
                                                            <td width="94">
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="5px">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="grid">
                                        <asp:ListView ID="lstSpecialities" runat="server" onitemcommand="lstSpecialities_ItemCommand">
                                            <LayoutTemplate>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <%--      <td width="232" align="left" class="grid-header">
                                                Company Id
                                            </td>--%>
                                                        <td height="30" width="5" class="grid-header">
                                                        </td>
                                                        <td width="262" align="left" class="grid-header">
                                                            Specialities
                                                        </td>
                                                        <td width="5" class="grid-header">
                                                        </td>
                                                        <td width="1" bgcolor="#CCCCCC">
                                                        </td>
                                                        <td width="61" align="center" class="grid-header">
                                                            Action
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
                                                                <td class="grid-bg-color grid-border-bottom"></td>
                                                                <td height="30" class="grid-bg-color grid-border-bottom">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("sTitle")%>' ></asp:Label>
                                                                </td>
                                                                 <td class="grid-bg-color grid-border-bottom">.
                                                                </td>
                                                                <td width="1" bgcolor="#CCCCCC">
                                                                </td>
                                                                <td align="center" class="grid-bg-color grid-border-bottom">
                                                                    <asp:ImageButton ID="btnEditSpecialities" runat="server" src="images/icon-view-edit.png" width="9" height="10" style="cursor: pointer"  CommandArgument='<%# Eval("iSpecialityID")%>' CommandName="editSpaciality"/>
                                                                    <asp:ImageButton ID="btnDeleteSpecialities" runat="server" src="images/icon-delete.png" width="9" height="10" style="cursor: pointer;margin-left:7px" CommandArgument='<%# Eval("iSpecialityID")%>' CommandName="deleteSpaciality"/>
                                                                    <%--<asp:Button ID="btnEditSpecialities" runat="server" Text="Edit" CommandArgument='<%# Eval("iSpecialityID")%>' CommandName="editSpaciality"/>
                                                                    <asp:Button ID="btnDeleteSpecialities" runat="server" Text="Delete" CommandArgument='<%# Eval("iSpecialityID")%>' CommandName="deleteSpaciality"/>--%>    
                                                                </td>
                                                            </tr>
                                                        
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnEditSpecialities"/>
                                                        <asp:PostBackTrigger ControlID="btnDeleteSpecialities"  />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </ItemTemplate>
                                            
                                        </asp:ListView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="paging">
                                            <tr>
                                                <td height="30" colspan="30">
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
                                                                <asp:DataPager ID="dtpSpecialities" Visible="true" PageSize="10" runat="server" 
                                                                    PagedControlID="lstSpecialities" onprerender="dtpSpecialities_PreRender"
                                                                    >
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
    </table>
    
</asp:Content>



