<%@ page language="C#" title="" masterpagefile="~/UserPanels/Client.master" autoeventwireup="true" inherits="UserPanels_PatientProfile, App_Web_uqe3rud5" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<title> Patient Cases</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        $(window).load(function () {
            setInterval(HideLabel(), 10000);
        });

        function HideLabel() {
            document.getElementById('<%= lblSuccessMessage.ClientID %>').style.display = "none";
        }        
     
        function fnUpdateProfile() {

            if ($("#txtNewPassword").val() != "") {

                if ($("#txtPassword").val() == "") {
                    alert("Enter Old Password");
                    return;
                }

                if ($("#txtNewPassword").val() != $("#txtRePassword").val()) {
                    alert("Re-type same password");
                    return;
                }
            }


            var iUserID = document.getElementById("hfUserID").value;

            var iAdminCompanyID = document.getElementById("hfAdminCompanyID").value;


            var iContactID = document.getElementById("hfContactID").value;


            var e = document.getElementById("ddlUserType");
            var iUserTypeID = e.options[e.selectedIndex].value;



            var txtEmail = document.getElementById("txtEmail").value;
            var txtUsername = document.getElementById("txtUsername").value;
            var txtPassword = document.getElementById("txtPassword").value;
            var txtNewPassword = document.getElementById("txtNewPassword").value;
            //Contacts



            var txtFirstName = document.getElementById("txtFirstName").value;
            var txtLastName = document.getElementById("txtLastName").value;

            var e = document.getElementById("ddlGender");
            var ddlsGender = e.options[e.selectedIndex].value;


            var txtdob = document.getElementById("txtdob").value;


            var txtPatientAddress = document.getElementById("txtPatientAddress").value;

            var txtPatientPostCode = document.getElementById("txtPatientPostCode").value;
            var txtPatientPhone = document.getElementById("txtPatientPhone").value;
            var txtPatientCountry = document.getElementById("txtPatientCountry").value;




            if (txtFirstName.length < 1) {
                txtFirstName.focus();

                return;
            }
            if (txtLastName.length < 1) {
                txtLastName.focus();

                return;
            }

            if (txtPatientPostCode.length < 1) {
                txtPatientPostCode.focus();

                return;
            }

            if (txtUsername.length < 1) {
                txtUsername.focus();

                return;
            }

            if (txtRePassword.length > 0 || txtNewPassword.length > 0) {
                if (txtPassword.length < 1) {
                    txtPassword.focus();
                    return;
                }
            }

            var check = txtEmail.indexOf('@', 0);

            if (parseInt(check) < 0) {
                txtEmail.focus();
                alert('Invalid email address format\nPlease provide a valid email address.');
                return;
            }

            var check2 = txtEmail.indexOf('.', 0);

            if (parseInt(check2) < 0) {
                txtEmail.focus();
                alert('Invalid email address\nEmail address can be like -> example@example.com');

                return;
            }




            //string sUserID, string sUserType, string sName, string sEmail, string sUserName, string sPassword, string sAdminCompanyID, string iContactID, string sFirstName, string sLastName, string sGender, string dtDateOfBirth, string strEmail, string sAddress, string sPhone
            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnUpdatePatientProfile",
                data: "{sUserID:'" + iUserID + "', sUserType:'" + iUserTypeID + "', sEmail:'" + txtEmail + "', sUserName:'" + txtUsername + "', sPassword:'" + txtPassword + "', sAdminCompanyID:'" + iAdminCompanyID + "', iContactID:'" + iContactID + "', sFirstName:'" + txtFirstName + "',sLastName:'" + txtLastName + "', sGender:'" + ddlsGender + "', dtDateOfBirth:'" + txtdob + "', sAddress:'" + txtPatientAddress + "', sPhone:'" + txtPatientPhone + "', sPostCode:'" + txtPatientPostCode + "', sCountry:'" + txtPatientCountry + "','sNewPassword':'" + txtNewPassword + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {
                    var result = response.d;
                    if (result == 1) {

                        document.getElementById('<%= lblSuccessMessage.ClientID %>').style.display = "block";
                        var lblSuccessMessage = document.getElementById("lblSuccessMessage");
                        lblSuccessMessage.innerHTML = "Profile Updated";
                    }
                    else if (result == 2) // Username Exists
                    {
                        var lblSuccessMessage = document.getElementById("lblSuccessMessage");
                        lblSuccessMessage.innerHTML = "username already taken";
                        lblSuccessMessage.style.color = "#f65618";

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
                    else if (result == -1) {
                        alert('Wrong Old Password');
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
                                        <asp:HiddenField ID="hfContactID" runat="server" ClientIDMode="Static" />
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
                                                                                                    <asp:DropDownList ID="ddlUserType" ClientIDMode="Static" CssClass="field-220" runat="server"
                                                                                                        OnSelectedIndexChanged="ddlUserType_SelectedIndexChanged">
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
                                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*"
                                                                                                        Text="*" ControlToValidate="txtUsername" ValidationGroup="validateProfile" ValidationExpression="^[a-z0-9._-]{2,25}$"></asp:RegularExpressionValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtUsername" ClientIDMode="Static" CssClass="validate[required,custom[username]] field-220"
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
                                                                                                    Old Password:
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtPassword" ClientIDMode="Static" CssClass="field-220" runat="server"
                                                                                                        TextMode="Password"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    New Password:
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtNewPassword" ClientIDMode="Static" CssClass="field-220" runat="server"
                                                                                                        TextMode="Password"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Re-Type Password:
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtRePassword" ClientIDMode="Static" CssClass="field-220" runat="server"
                                                                                                        TextMode="Password"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="* Password should be same"
                                                                                                        ControlToCompare="txtNewPassword" ControlToValidate="txtRePassword" ValidationGroup="grpValidateExpertDetials"
                                                                                                        ForeColor="Red"></asp:CompareValidator><asp:Label ID="lblErrorMessage" runat="server"
                                                                                                            Text=""></asp:Label>
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
                                                                                                                &nbsp;<%--<asp:ImageButton ID="lnkbSave" runat="server" ImageUrl="images/btn-save.png" CausesValidation="true"
                                                                    ValidationGroup="validateProfile" ClientIDMode="Static" />--%>
                                                                                                            </td>
                                                                                                            <td width="50" align="left">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td width="150" align="left">
                                                                                                                <asp:Label ID="lblSuccessMessage" ClientIDMode="Static" ForeColor="DarkGreen" Font-Bold="true"
                                                                                                                    Font-Size="11px" runat="server" Text="" Width="120px"></asp:Label>
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
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    Fisrt Name
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                                                                                        Display="None" ControlToValidate="txtFirstName" Text="*" ValidationGroup="validateProfile"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input name="textfield2" clientidmode="Static" runat="server" type="text" class="validate[required] field-220"
                                                                                                        id="txtFirstName" />
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
                                                                                                    Last Name
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                                                                                        Display="None" ControlToValidate="txtLastName" Text="*" ValidationGroup="validateProfile"></asp:RequiredFieldValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input name="textfield2" clientidmode="Static" runat="server" type="text" class="validate[required] field-220"
                                                                                                        id="txtLastName" />
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
                                                                                                    Gender
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:DropDownList ID="ddlGender" ClientIDMode="Static" runat="server" CssClass="validate[required] field-220">
                                                                                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                                                                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                                                                                    </asp:DropDownList>
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
                                                                                                    Date Of Birth
                                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Maroon" ControlToValidate="txtdob"
                                                                                                        runat="server" ErrorMessage="*" ValidationGroup="grpValidateExpertDetials"></asp:RequiredFieldValidator>
                                                                                                    <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtdob" runat="server"
                                                                                                        PopupPosition="BottomLeft" Enabled="true">
                                                                                                    </asp:CalendarExtender>
                                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ForeColor="Maroon"
                                                                                                        runat="server" ValidationGroup="grpValidateExpertDetials" ControlToValidate="txtdob"
                                                                                                        ErrorMessage="*" ToolTip="* Invalid date Format e.g. MM/DD/YYYY" ValidationExpression="^((((0[13578])|([13578])|(1[02]))[\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\/](([1-9])|([0-2][0-9]))))[\/]\d{4}$|^\d{4}$"></asp:RegularExpressionValidator>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtdob" ClientIDMode="Static" runat="server" type="text" CssClass="validate[required] field-220"></asp:TextBox>
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
                                                                                                <td style="vertical-align: top;">
                                                                                                    Address
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtPatientAddress" ClientIDMode="Static" CssClass="field-220" TextMode="MultiLine"
                                                                                                        Height="63px" runat="server"></asp:TextBox>
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
                                                                                                    Phone
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtPatientPhone" ClientIDMode="Static" CssClass="field-220" runat="server"></asp:TextBox>
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
                                                                                                        id="txtPatientPostCode" />
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
                                                                                                    Country
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input name="textfield2" clientidmode="Static" runat="server" type="text" class="field-220"
                                                                                                        id="txtPatientCountry" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right">
                                                                                        <img alt="Save" src="images/btn-save.png" style="cursor: pointer;" onclick="fnUpdateProfile()" />
                                                                                    </td>
                                                                                    &nbsp;
                                                                                    <td align="left">
                                                                                        <asp:ImageButton ID="lnkbCancel" runat="server" ImageUrl="images/btn-cancel.png"
                                                                                            CausesValidation="false" ValidationGroup="validateProfile" OnClick="lnkbCancel_Click" />
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
</asp:Content>
