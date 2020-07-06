<%@ page title="" language="C#" masterpagefile="~/UserPanels/Client.master" autoeventwireup="true" inherits="UserPanels_PatientCaseDetails, App_Web_iiwsqckp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        #directions-panel
        {
            height: 100%;
            float: right;
            width: 390px;
            overflow: auto;
        }
        
        #map-canvas
        {
            margin-right: 400px;
            overflow: auto;
        }
        
        #control
        {
            background: #fff;
            padding: 5px;
            font-size: 14px;
            font-family: Arial;
            border: 1px solid #ccc;
            box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
            display: none;
        }
        
        @media print
        {
            #map-canvas
            {
                height: 500px;
                margin: 0;
            }
        
            #directions-panel
            {
                float: none;
                width: auto;
            }
        }
    </style>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script type="text/javascript">

        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();

        $(document).ready(function () {

            $("fieldset input,fieldset select").attr('disabled', 'disabled');

        });

        function fnLoadCountry(t) {

            var postCode;
            if (t.toString() == "1") {
                postCode = document.getElementById("<%=txtBillingPostCode.ClientID %>");
                postCode.value = postCode.value.replace(/\s/g, '');
            }
            if (t.toString() == "2") {

                postCode = document.getElementById("<%=txtShippingPostCode.ClientID %>")
                postCode.value = postCode.value.replace(/\s/g, '');
            }

            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnLoadCountry",
                data: "{'sPostcode':'" + postCode.value.toString() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result == "") {
                        alert("Invalid ZipCode/PostCode");
                        postCode.focus();
                    }
                    else if (result != "") {

                        var dropdownlistboxCountry = document.getElementById("<%= ddlBillingCountry.ClientID %>")

                        for (var x = 0; x < dropdownlistboxCountry.length; x++) {
                            if (result == dropdownlistboxCountry.options[x].value.toString()) {
                                dropdownlistboxCountry.selectedIndex = x;
                                break;
                            }
                        }
                    }
                    else if (result != "") {

                        var dropdownlistboxCountry1 = document.getElementById("<%= ddlShippingCountry.ClientID %>")

                        for (var x = 0; x < dropdownlistboxCountry1.length; x++) {
                            if (result == dropdownlistboxCountry1.options[x].value.toString()) {
                                dropdownlistboxCountry1.selectedIndex = x;
                                break;
                            }
                        }
                    }

                },
                failure: function (msg) {
                    alert(msg);
                }

            });
            return false;

        }
        function initialize() {



            directionsDisplay = new google.maps.DirectionsRenderer();
            var mapOptions = {
                zoom: 7,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: new google.maps.LatLng(41.850033, -87.6500523)
            };
            var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('directions-panel'));

            //            var control = document.getElementById('control').style.display = 'block';
            //             //control.style.display = 'block';
            //            map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
        }

        var start = '<%= Session["sBillingCode"].ToString() %>';
        var end = '<%= Session["sPostCode"].ToString() %>';
        //var start ='10008'
        //var end ='L7B1B1'
        var request =
            {
                origin: start,
                destination: end,
                travelMode: google.maps.TravelMode.DRIVING
            };
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });




        //  google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset disabled>
                <table width="968" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="968" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="956" align="left" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                                                                                                                                        Case Information
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
                                                                                                            <td>
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Case Status:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:DropDownList ID="ddlCaseStatus" CssClass="field-220" runat="server">
                                                                                                                                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                                                                                                                                <asp:ListItem Value="Appointment Attended" Text="Appointment Attended"></asp:ListItem>
                                                                                                                                <asp:ListItem Value="Appointment DNA" Text="Appointment DNA"></asp:ListItem>
                                                                                                                                <asp:ListItem Value="Closed" Text="Closed"></asp:ListItem>
                                                                                                                                <asp:ListItem Value="Canceled" Text="Canceled"></asp:ListItem>
                                                                                                                            </asp:DropDownList>
                                                                                                                        </td>
                                                                                                                        <td width="478" align="left">
                                                                                                                            &nbsp;
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
                                                                                                                            &nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            &nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            &nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
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
                                                                                                <td>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="paging">
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
                                                                                <tr>
                                                                                    <td onload="initialize()" height="300">
                                                                                        <%-- <div id="control">--%>
                                                                                        <%--<strong>Start:</strong>
                                                                                        <select id="start" onchange="calcRoute();">
                                                                                            <option value="10001>Chicago</option>
                                                                                            <option value="st louis, mo">St Louis</option>
                                                                                            <option value="joplin, mo">Joplin, MO</option>
                                                                                            <option value="oklahoma city, ok">Oklahoma City</option>
                                                                                            <option value="amarillo, tx">Amarillo</option>
                                                                                            <option value="gallup, nm">Gallup, NM</option>
                                                                                            <option value="flagstaff, az">Flagstaff, AZ</option>
                                                                                            <option value="winona, az">Winona</option>
                                                                                            <option value="kingman, az">Kingman</option>
                                                                                            <option value="barstow, ca">Barstow</option>
                                                                                            <option value="san bernardino, ca">San Bernardino</option>
                                                                                            <option value="los angeles, ca">Los Angeles</option>
                                                                                        </select>
                                                                                        <strong>End:</strong>
                                                                                        <select id="end" onchange="calcRoute();">
                                                                                            <option value="chicago, il">Chicago</option>
                                                                                            <option value="st louis, mo">St Louis</option>
                                                                                            <option value="joplin, mo">Joplin, MO</option>
                                                                                            <option value="oklahoma city, ok">Oklahoma City</option>
                                                                                            <option value="amarillo, tx">Amarillo</option>
                                                                                            <option value="gallup, nm">Gallup, NM</option>
                                                                                            <option value="flagstaff, az">Flagstaff, AZ</option>
                                                                                            <option value="winona, az">Winona</option>
                                                                                            <option value="kingman, az">Kingman</option>
                                                                                            <option value="barstow, ca">Barstow</option>
                                                                                            <option value="san bernardino, ca">San Bernardino</option>
                                                                                            <option value="H2E2G1">Los Angeles</option>
                                                                                        </select>--%>
                                                                                        <%--  </div>--%>
                                                                                        <div id="directions-panel">
                                                                                        </div>
                                                                                        <div id="map-canvas">
                                                                                        </div>
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
                                                                                                                                        Patient Information
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
                                                                                                            <td>
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            First Name:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Maroon"
                                                                                                                                ControlToValidate="txtFirstName" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                                ErrorMessage="*" ValidationGroup="validatePateintInfo"></asp:RequiredFieldValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Last Name:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Maroon"
                                                                                                                                ControlToValidate="txtLastName" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                                ErrorMessage="*" ValidationGroup="validatePateintInfo"></asp:RequiredFieldValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Gender:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="field-220">
                                                                                                                                <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                                                                                                                <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                                                                                                            </asp:DropDownList>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            D.O.B:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Maroon"
                                                                                                                                ControlToValidate="txtDOB" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                                ErrorMessage="*" ValidationGroup="validatePateintInfo"></asp:RequiredFieldValidator>
                                                                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ForeColor="Maroon"
                                                                                                                                runat="server" ValidationGroup="validatePateintInfo" ControlToValidate="txtDOB"
                                                                                                                                Enabled="true" SetFocusOnError="true" ErrorMessage="*" ToolTip="* Invalid date Format e.g. MM/DD/YYYY"
                                                                                                                                ValidationExpression="^((((0[13578])|([13578])|(1[02]))[\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\/](([1-9])|([0-2][0-9]))))[\/]\d{4}$|^\d{4}$"></asp:RegularExpressionValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtDOB" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                            <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDOB" Enabled="true"
                                                                                                                                PopupPosition="BottomLeft" runat="server">
                                                                                                                            </asp:CalendarExtender>
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
                                                                                                                        <td width="478" align="left" colspan="2">
                                                                                                                            <span style="font-size: 11px; font-weight: bold;">Billing Details:</span>
                                                                                                                        </td>
                                                                                                                        <td width="478" align="left" style="font-size: 11px; font-weight: bold;" colspan="2">
                                                                                                                            <span style="font-size: 11px; font-weight: bold;">Shipping Details:</span>
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
                                                                                                                            Billing Address:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtBillingAddress" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Shipping Address:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtShippingAddress" runat="server" CssClass="field-220"></asp:TextBox>
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
                                                                                                                            Billing Post Code:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtBillingPostCode" runat="server" CssClass="field-220" onchange="javascript:fnLoadCountry('1');"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Shipping Post Code:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtShippingPostCode" runat="server" CssClass="field-220" onchange="javascript:fnLoadCountry('2');"></asp:TextBox>
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
                                                                                                                            Billing Country:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:DropDownList ID="ddlBillingCountry" runat="server" CssClass="field-220">
                                                                                                                                <asp:ListItem Value="United States" Text="United States"></asp:ListItem>
                                                                                                                                <asp:ListItem Value="Canada" Text="Canada"></asp:ListItem>
                                                                                                                            </asp:DropDownList>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Shipping Country:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:DropDownList ID="ddlShippingCountry" runat="server" CssClass="field-220">
                                                                                                                                <asp:ListItem Value="United States" Text="United States"></asp:ListItem>
                                                                                                                                <asp:ListItem Value="Canada" Text="Canada"></asp:ListItem>
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
                                                                                                                            Billing Phone:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtBillingPhone" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Shipping Phone:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtShippingPhone" runat="server" CssClass="field-220"></asp:TextBox>
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
                                                                                                                            Billing Email:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtBillingEmail" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Shipping Email:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtShippingEmail" runat="server" CssClass="field-220"></asp:TextBox>
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
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;
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
                                                                                                                                        Patient Documents
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
                                                                                                    <table class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                                                        <thead>
                                                                                                            <tr>
                                                                                                                <td style="width: 120px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                                                    Title
                                                                                                                </td>
                                                                                                                <td width="5" class="grid-header">
                                                                                                                </td>
                                                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                                                </td>
                                                                                                                <td width="5" class="grid-header">
                                                                                                                </td>
                                                                                                                <td style="width: 150px" class="grid-header">
                                                                                                                    Description
                                                                                                                </td>
                                                                                                                <td width="5" class="grid-header">
                                                                                                                </td>
                                                                                                                <td width="1" bgcolor="#CCCCCC">
                                                                                                                </td>
                                                                                                                <td width="5" class="grid-header">
                                                                                                                </td>
                                                                                                                <td style="width: 150px" class="grid-header">
                                                                                                                    Download
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </thead>
                                                                                                        <asp:ListView ID="lvDocument" runat="server">
                                                                                                            <LayoutTemplate>
                                                                                                                <tbody>
                                                                                                                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                                                                </tbody>
                                                                                                            </LayoutTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <tr>
                                                                                                                    <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                                                        <span id="idiProductID" title='<%# Eval("sDocumentName") %>'>
                                                                                                                            <%# Eval("sDocumentName")%></span>
                                                                                                                    </td>
                                                                                                                    <td width="5" class="grid-border-bottom">
                                                                                                                    </td>
                                                                                                                    <td width="1" bgcolor="#CCCCCC">
                                                                                                                    </td>
                                                                                                                    <td width="5" class="grid-border-bottom">
                                                                                                                    </td>
                                                                                                                    <td class="grid-border-bottom">
                                                                                                                        <span id="idsName" title='<%# Eval("sDescription") %>'>
                                                                                                                            <%# Eval("sDescription")%></span>
                                                                                                                    </td>
                                                                                                                    <td width="5" class="grid-border-bottom">
                                                                                                                    </td>
                                                                                                                    <td width="1" bgcolor="#CCCCCC">
                                                                                                                    </td>
                                                                                                                    <td width="5" class="grid-border-bottom">
                                                                                                                    </td>
                                                                                                                    <td class="grid-border-bottom">
                                                                                                                        <a href='../UploadedCaseDocuments/<%# Eval("sDocumentPath")%>' target="_blank" title="Download">
                                                                                                                            <img alt="Download" src="images/bullet-heading-right.png" />
                                                                                                                        </a>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </ItemTemplate>
                                                                                                            <AlternatingItemTemplate>
                                                                                                                <tr>
                                                                                                                    <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                                                        <span id="idiProductID" title='<%# Eval("sDocumentName") %>'>
                                                                                                                            <%# Eval("sDocumentName")%></span>
                                                                                                                    </td>
                                                                                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                    </td>
                                                                                                                    <td width="1" bgcolor="#CCCCCC">
                                                                                                                    </td>
                                                                                                                    <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                    </td>
                                                                                                                    <td class="grid-bg-color grid-border-bottom">
                                                                                                                        <span id="idsName" title='<%# Eval("sDescription") %>'>
                                                                                                                            <%# Eval("sDescription")%></span>
                                                                                                                    </td>
                                                                                                                    <td width="5" class="grid-border-bottom">
                                                                                                                    </td>
                                                                                                                    <td width="1" bgcolor="#CCCCCC">
                                                                                                                    </td>
                                                                                                                    <td width="5" class="grid-border-bottom">
                                                                                                                    </td>
                                                                                                                    <td class="grid-border-bottom">
                                                                                                                        <a href='../UploadedCaseDocuments/<%# Eval("sDocumentPath")%>' target="_blank" title="Download">
                                                                                                                            <img alt="Download" src="images/bullet-heading-right.png" />
                                                                                                                        </a>&nbsp;
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </AlternatingItemTemplate>
                                                                                                            <EmptyItemTemplate>
                                                                                                                <tr>
                                                                                                                    <td colspan="9">
                                                                                                                        No Document added yet
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </EmptyItemTemplate>
                                                                                                        </asp:ListView>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;
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
                                                                                                                                        Basic Question and Answer
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
                                                                                                            <td>
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Date Of Birth
                                                                                                                            <asp:CalendarExtender ID="CalendarExtender3" TargetControlID="txtQADOB" Enabled="true"
                                                                                                                                PopupPosition="BottomLeft" runat="server">
                                                                                                                            </asp:CalendarExtender>
                                                                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ForeColor="Maroon"
                                                                                                                                runat="server" ValidationGroup="validateGeneralQA" ControlToValidate="txtQADOB"
                                                                                                                                Enabled="true" SetFocusOnError="true" ErrorMessage="*" ToolTip="* Invalid date Format e.g. MM/DD/YYYY"
                                                                                                                                ValidationExpression="^((((0[13578])|([13578])|(1[02]))[\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\/](([1-9])|([0-2][0-9]))))[\/]\d{4}$|^\d{4}$"></asp:RegularExpressionValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtQADOB" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Sex:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:DropDownList ID="ddlQAGender" runat="server" CssClass="field-220">
                                                                                                                                <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                                                                                                                <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
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
                                                                                                                            Height:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtQAHeight" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Past Condition:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtQAPastCondition" runat="server" CssClass="field-220"></asp:TextBox>
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
                                                                                                                            Weight:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtQAWeight" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Current Condition:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtQACurrentCondition" runat="server" CssClass="field-220"></asp:TextBox>
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
                                                                                                                            Do You Smoke?
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:CheckBox ID="chkbQASmoke" runat="server" />
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Family Conditions:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtQAFamilyCondition" runat="server" CssClass="field-220"></asp:TextBox>
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
                                                                                                                            Smoke More then 1 Pack?
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:CheckBox ID="chkbQASmokeMoreThan1" runat="server" />
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
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
                                                                                                                            Drink More then 2 Drinks?
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:CheckBox ID="chkbQADrinkMoreThan2" runat="server" />
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
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
                                                                                                                            Pregnant?
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:CheckBox ID="chkbQAPragnent" runat="server" />
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
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
                                                                                                                            Plan to get Pregnant?
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:CheckBox ID="chkbQAPlantoPragnent" runat="server" />
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
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
                                                                                                                            List Allergies?
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtQAAllegiesList" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
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
                                                                                                                            Primary Physician
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:DropDownList ID="ddlPrimaryPhysician" CssClass="field-220" runat="server" AutoPostBack="True"
                                                                                                                                OnSelectedIndexChanged="ddlPrimaryPhysician_SelectedIndexChanged">
                                                                                                                            </asp:DropDownList>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
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
                                                                                                                            Primary Physician Name
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtQAPrimaryPhysiican" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
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
                                                                                                                            Physician Phone
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtPhysicianPhone" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
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
                                                                                                                            Date Last Dr Visit
                                                                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Maroon"
                                                                                                                                runat="server" ValidationGroup="validateGeneralQA" ControlToValidate="txtQALastDateVisit"
                                                                                                                                Enabled="true" SetFocusOnError="true" ErrorMessage="*" ToolTip="* Invalid date Format e.g. MM/DD/YYYY"
                                                                                                                                ValidationExpression="^((((0[13578])|([13578])|(1[02]))[\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\/](([1-9])|([0-2][0-9]))))[\/]\d{4}$|^\d{4}$"></asp:RegularExpressionValidator>
                                                                                                                            <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtQALastDateVisit"
                                                                                                                                Enabled="true" PopupPosition="BottomLeft" runat="server">
                                                                                                                            </asp:CalendarExtender>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtQALastDateVisit" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td height="3">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;
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
                                                                                                                                        Detail Question Answers
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
                                                                                                <td>
                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                        <tr>
                                                                                                            <td width="600" align="left">
                                                                                                                Do you suffer from depression?
                                                                                                            </td>
                                                                                                            <td width="356" align="left">
                                                                                                                <asp:DropDownList ID="ddlQ1" runat="server" Width="60px">
                                                                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Have you previously been treated for any type of immune deficiency?
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:DropDownList ID="ddlQ2" runat="server" Width="60px">
                                                                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Do you have a history of heart problems, fluid retention, or uncontrolled hypertension?
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:DropDownList ID="ddlQ3" runat="server" Width="60px">
                                                                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Have you ever had a seizure?
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:DropDownList ID="ddlQ4" runat="server" Width="60px">
                                                                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Have you ever had an allergic reaction to this medication?
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:DropDownList ID="ddlQ5" runat="server" Width="60px">
                                                                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Do you take or have you taken antidepressants?
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:DropDownList ID="ddlQ6" runat="server" Width="60px">
                                                                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Do you have a history of narcotic or opiate usage?
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:DropDownList ID="ddlQ7" runat="server" Width="60px">
                                                                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Do you have high blood pressure?
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:DropDownList ID="ddlQ8" runat="server" Width="60px">
                                                                                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Your level of pain: On a scale of 1 - 10 with 1 being 'mild pain' and 10 being 'severe
                                                                                                                pain', please indicate how you would rate your level of pain.
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:DropDownList ID="ddlQ9" runat="server" Width="60px">
                                                                                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                                                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                                                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                                                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                                                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                                                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                                                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                                                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                                                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                                                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Indicate the location of the pain :
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:TextBox ID="txtQ10" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="2" style="height: 10px;">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                Indicate the duration of the pain: 0-6 months, 6 months - 1 year, greater than 1
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <table>
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <asp:DropDownList ID="ddlQ11" runat="server" Width="100px">
                                                                                                                                <asp:ListItem Value="1 month">1 month</asp:ListItem>
                                                                                                                                <asp:ListItem Value="2 month">2 month</asp:ListItem>
                                                                                                                                <asp:ListItem Value="3 month">3 month</asp:ListItem>
                                                                                                                                <asp:ListItem Value="4 month">4 month</asp:ListItem>
                                                                                                                                <asp:ListItem Value="5 month">5 month</asp:ListItem>
                                                                                                                                <asp:ListItem Value="6 month">6 month</asp:ListItem>
                                                                                                                            </asp:DropDownList>
                                                                                                                        </td>
                                                                                                                        <td>
                                                                                                                            <asp:DropDownList ID="ddlQ112" runat="server" Width="100px">
                                                                                                                                <asp:ListItem Value="1 year">1 year</asp:ListItem>
                                                                                                                                <asp:ListItem Value="greater than 1 year">greater than 1 year</asp:ListItem>
                                                                                                                            </asp:DropDownList>
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
                                                                                        &nbsp;
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
                                                                                                                                        Order Information
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
                                                                                                            <td>
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Doctor:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Maroon"
                                                                                                                                ControlToValidate="txtOICaseDoctor" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                                ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtOICaseDoctor" runat="server" CssClass="field-220" Enabled="False"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Pharmacy:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Maroon"
                                                                                                                                ControlToValidate="ddlOIPharmacy" Enabled="true" InitialValue="-1" SetFocusOnError="true"
                                                                                                                                runat="server" ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:DropDownList ID="ddlOIPharmacy" runat="server" CssClass="field-220">
                                                                                                                            </asp:DropDownList>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Tracking No:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Maroon"
                                                                                                                                ControlToValidate="txtOITrackingNo" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                                ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtOITrackingNo" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Discount:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Maroon"
                                                                                                                                ControlToValidate="txtOIDiscount" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                                ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"
                                                                                                                                runat="server" ErrorMessage="*" ControlToValidate="txtOIDiscount" ValidationGroup="validateOrderInformation"></asp:RegularExpressionValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtOIDiscount" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Gift Certificates:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtOIGiftCertificate" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Handling
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtOIHandling" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Shipping:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtOIShipping" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            <span style="font-size: 11px; font-weight: bold;">Add Products:</span>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Select Product:<asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="Maroon"
                                                                                                                                ControlToValidate="ddlOIProducts" Enabled="true" InitialValue="-1" SetFocusOnError="true"
                                                                                                                                runat="server" ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:DropDownList ID="ddlOIProducts" CssClass="field-220" runat="server" AutoPostBack="True"
                                                                                                                                OnSelectedIndexChanged="ddlOIProducts_SelectedIndexChanged">
                                                                                                                            </asp:DropDownList>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Product Code:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:Label ID="lblOIProductCode" runat="server" Text="Item-Code"></asp:Label>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Item Price
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtOIItemPrice" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Quantity:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            <asp:TextBox ID="txtOIQty" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4">
                                                                                                                            <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <thead>
                                                                                                                                    <tr>
                                                                                                                                        <td style="width: 80px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                                                                            No#
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td style="width: 150px" class="grid-header">
                                                                                                                                            Product
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td style="width: 150px" class="grid-header">
                                                                                                                                            Type
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td style="width: 80px" class="grid-header">
                                                                                                                                            Quantity
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td style="width: 80px" class="grid-header">
                                                                                                                                            Item Price
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                </thead>
                                                                                                                                <asp:ListView ID="lvProductsList" runat="server">
                                                                                                                                    <LayoutTemplate>
                                                                                                                                        <tbody>
                                                                                                                                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                                                                                        </tbody>
                                                                                                                                    </LayoutTemplate>
                                                                                                                                    <ItemTemplate>
                                                                                                                                        <tr>
                                                                                                                                            <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                                                                                <span id="idiProductID" title='<%# Eval("SerialNo") %>'>
                                                                                                                                                    <%# Eval("SerialNo")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-border-bottom">
                                                                                                                                                <span id="idsName" title='<%# Eval("sProductName") %>'>
                                                                                                                                                    <%# Eval("sProductName")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-border-bottom">
                                                                                                                                                <span id="Span1" title='<%# Eval("sType") %>'>
                                                                                                                                                    <%# Eval("sType")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-border-bottom">
                                                                                                                                                <span id="Span2" title='<%# Eval("nQuantity") %>'>
                                                                                                                                                    <%# Eval("nQuantity")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-border-bottom">
                                                                                                                                                <span id="Span3" title='<%# Eval("nItemPrice") %>'>
                                                                                                                                                    <%# Eval("nItemPrice")%></span>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </ItemTemplate>
                                                                                                                                    <AlternatingItemTemplate>
                                                                                                                                        <tr>
                                                                                                                                            <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                                                                                <span id="idiProductID" title='<%# Eval("SerialNo") %>'>
                                                                                                                                                    <%# Eval("SerialNo")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-bg-color grid-border-bottom">
                                                                                                                                                <span id="idsName" title='<%# Eval("sProductName") %>'>
                                                                                                                                                    <%# Eval("sProductName")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-bg-color grid-border-bottom">
                                                                                                                                                <span id="Span4" title='<%# Eval("sType") %>'>
                                                                                                                                                    <%# Eval("sType")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-bg-color grid-border-bottom">
                                                                                                                                                <span id="Span5" title='<%# Eval("nQuantity") %>'>
                                                                                                                                                    <%# Eval("nQuantity")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-bg-color grid-border-bottom">
                                                                                                                                                <span id="Span6" title='<%# Eval("nItemPrice") %>'>
                                                                                                                                                    <%# Eval("nItemPrice")%></span>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </AlternatingItemTemplate>
                                                                                                                                    <EmptyItemTemplate>
                                                                                                                                        <tr>
                                                                                                                                            <td colspan="9" style="height: 5px">
                                                                                                                                                No Product added yet
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </EmptyItemTemplate>
                                                                                                                                </asp:ListView>
                                                                                                                            </table>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
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
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                        <tr>
                                                                                                            <td width="151" align="left">
                                                                                                                Put Order On Hold:
                                                                                                            </td>
                                                                                                            <td width="327" align="left">
                                                                                                                <table>
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <asp:RadioButton ID="rdbOSOnHoldYes" Text="Yes" runat="server" GroupName="grpOnHold" />
                                                                                                                        </td>
                                                                                                                        <td>
                                                                                                                            <asp:RadioButton ID="rdbOSOnHoldNo" Text="No" runat="server" GroupName="grpOnHold" />
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td width="151" align="left">
                                                                                                                Reason:
                                                                                                            </td>
                                                                                                            <td width="327" align="left">
                                                                                                                <asp:TextBox ID="txtOSOnHoldReason" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="4" style="height: 3px;">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td width="151" align="left">
                                                                                                                Cancel Order:
                                                                                                            </td>
                                                                                                            <td width="327" align="left">
                                                                                                                <table>
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <asp:RadioButton ID="rdbOSCancelOrderYes" Text="Yes" runat="server" GroupName="grpCancel" />
                                                                                                                        </td>
                                                                                                                        <td>
                                                                                                                            <asp:RadioButton ID="rdbOSCancelOrderNo" Text="No" runat="server" GroupName="grpCancel" />
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td width="151" align="left">
                                                                                                                Reason:
                                                                                                            </td>
                                                                                                            <td width="327" align="left">
                                                                                                                <asp:TextBox ID="txtOSCancelReason" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan="4" style="height: 3px;">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td width="151" align="left" style="vertical-align: top">
                                                                                                                Comments:
                                                                                                            </td>
                                                                                                            <td width="327" align="left">
                                                                                                                <asp:TextBox ID="txtOSComments" TextMode="MultiLine" Rows="6" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                            </td>
                                                                                                            <td width="151" align="left">
                                                                                                            </td>
                                                                                                            <td width="327" align="left">
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
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td>
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="form">
                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                        <tr>
                                                                                                            <td height="3">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td width="478" align="left" colspan="2">
                                                                                                                            <span style="font-size: 11px; font-weight: bold;">Doctor's Instructions:</span>
                                                                                                                        </td>
                                                                                                                        <td width="478" align="left" style="font-size: 11px; font-weight: bold;" colspan="2">
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
                                                                                                                            Doctor Instructions:
                                                                                                                        </td>
                                                                                                                        <td width="805" align="left" colspan="3">
                                                                                                                            <asp:TextBox ID="txtDIDocInstructions" Rows="6" TextMode="MultiLine" runat="server"
                                                                                                                                CssClass="field-555"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left" valign="top">
                                                                                                                            Doctor's Note(s):
                                                                                                                        </td>
                                                                                                                        <td width="400" align="left" colspan="2" valign="top">
                                                                                                                            <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <thead>
                                                                                                                                    <tr>
                                                                                                                                        <td style="width: 120px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                                                                            No#
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-header">
                                                                                                                                        </td>
                                                                                                                                        <td style="width: 150px" class="grid-header">
                                                                                                                                            Note
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                </thead>
                                                                                                                                <asp:ListView ID="lvNotes" runat="server">
                                                                                                                                    <LayoutTemplate>
                                                                                                                                        <tbody>
                                                                                                                                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                                                                                        </tbody>
                                                                                                                                    </LayoutTemplate>
                                                                                                                                    <ItemTemplate>
                                                                                                                                        <tr>
                                                                                                                                            <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                                                                                <span id="idiProductID" title='<%# Eval("CaseNoteSerialNo") %>'>
                                                                                                                                                    <%# Eval("CaseNoteSerialNo")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-border-bottom">
                                                                                                                                                <span id="idsName" title='<%# Eval("sDescription") %>'>
                                                                                                                                                    <%# Eval("sDescription")%></span>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </ItemTemplate>
                                                                                                                                    <AlternatingItemTemplate>
                                                                                                                                        <tr>
                                                                                                                                            <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                                                                                <span id="idiProductID" title='<%# Eval("CaseNoteSerialNo") %>'>
                                                                                                                                                    <%# Eval("CaseNoteSerialNo")%></span>
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                                            </td>
                                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                            </td>
                                                                                                                                            <td class="grid-bg-color grid-border-bottom">
                                                                                                                                                <span id="idsName" title='<%# Eval("sDescription") %>'>
                                                                                                                                                    <%# Eval("sDescription")%></span>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </AlternatingItemTemplate>
                                                                                                                                    <EmptyItemTemplate>
                                                                                                                                        <tr>
                                                                                                                                            <td colspan="9">
                                                                                                                                                No Note added yet
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </EmptyItemTemplate>
                                                                                                                                </asp:ListView>
                                                                                                                            </table>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4" style="height: 3px;">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td colspan="4">
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
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td height="5">
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:HiddenField ID="hfBillingPostCode" runat="server" />
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
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
