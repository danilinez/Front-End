<%@ page language="C#" autoeventwireup="true" inherits="ControlPanel_Default, App_Web_x5lf5vqe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Wheel VHS System - Admin Panel</title>
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/jquery.validationEngine.js" type="text/javascript"></script>
    <script src="js/jquery.validationEngine-en.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        jQuery(document).ready(function () {
            // binds form submission and fields to the validation engine
            jQuery("#form1").validationEngine();
        });
    </script>
    <!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center" valign="top" class="header">
                <table width="960" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                        <td height="5">&nbsp;
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <img src="images/logo-pharmacy.png">
                        </td>
                    </tr>
                    <tr>
                        <td height="5">&nbsp;
                            
                        </td>
                    </tr>
                </tbody></table>
            </td>
        </tr>
        <tr>
            <td height="1" class="login-line">
            </td>
        </tr>
        <tr>
            <td align="center">
                <table width="548" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <form id="form-login" class="formular" method="post">
                            <table width="548" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <table width="335" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="7">
                                                    <img src="images/login_heading_left-crn.png" width="7" height="45" />
                                                </td>
                                                <td class="login-heading">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10">&nbsp;
                                                                
                                                            </td>
                                                            <td align="left">
                                                                Welcome To Login!
                                                            </td>
                                                            <td align="right">
                                                                <img src="images/icon-login.png" width="21" height="21" />
                                                            </td>
                                                            <td width="10">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="7">
                                                    <img src="images/login_heading_right-crn.png" width="7" height="45" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="35">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="548" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="67" align="center" valign="top" class="login_field_bg">
                                                    <table width="336" border="0" align="center" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td height="38">
                                                                <table width="336" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #CCC;border-radius: 4px;">
                                                                    <tr>
                                                                        <td width="8" height="5">
                                                                        </td>
                                                                        <td width="290">
                                                                        </td>
                                                                        <td width="30" align="right">
                                                                        </td>
                                                                        <td width="8">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp;
                                                                            
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtUserName" CssClass="validate[required] login_field_290" runat="server"
                                                                                placeholder="Username"></asp:TextBox>
                                                                        </td>
                                                                        <td align="right">
                                                                            <img src="images/icon-username.png" width="16" height="16" />
                                                                        </td>
                                                                        <td>&nbsp;
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="5">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUserName"
                                                                                Text="*" ValidationGroup="ValidateLogin" runat="server" ErrorMessage="*" Display="None"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td align="right">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="67" align="center" valign="top" class="login_field_bg">
                                                    <table width="336" border="0" align="center" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td height="38">
                                                                <table width="336" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #CCC;border-radius: 4px;">
                                                                    <tr>
                                                                        <td width="8" height="5">
                                                                        </td>
                                                                        <td width="290">
                                                                        </td>
                                                                        <td width="30" align="right">
                                                                        </td>
                                                                        <td width="8">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp;
                                                                            
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="validate[required] login_field_290"
                                                                                runat="server" placeholder="Password"></asp:TextBox>
                                                                            <%--<input name="pass" type="text" class="validate[required] login_field_290" id="pass"
placeholder="Password" onfocus="if (this.value==this.defaultValue) this.value = ''"
onblur="if (this.value=='') this.value = this.defaultValue" />--%>
                                                                        </td>
                                                                        <td align="right">
                                                                            <img src="images/icon-password.png" width="16" height="16" />
                                                                        </td>
                                                                        <td>&nbsp;
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="5">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword"
                                                                                Text="*" ValidationGroup="ValidateLogin" runat="server" ErrorMessage="*" Display="None"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td align="right">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="4" class="login">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <table width="548" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="110">&nbsp;
                                                    
                                                </td>
                                                <td align="left">
                                                    <asp:ImageButton ID="imgBtnLogin" ImageUrl="images/btn_login.png" CausesValidation="true"
                                                        ValidationGroup="ValidateLogin" CssClass="login_button" runat="server" OnClick="imgBtnLogin_Click" />
                                                    <%-- <input type="image" src="images/btn_login.png" name="button2" id="button2" value="Login"
class="login_button" />--%>
                                                </td>
                                            </tr>
                                            <tr>
                                            <td>
                                                </td>
                                            <td><asp:Label ID="lblMessage" runat="server" Text="" ForeColor="#ffffff"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="498" align="left">&nbsp;
                                        
                                    </td>
                                </tr>
                            </table>
                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
       
        <tr>
            <td>&nbsp;
                
            </td>
        </tr>
        <tr class="footer">
            <td  align="center">
                <table width="548" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr >
                        <td align="center">
                       © 2014 Wheel Health Care Services Inc. All rights reserved.
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                
            </td>
        </tr>
    </table>
   
    </form>
</body>
</html>
