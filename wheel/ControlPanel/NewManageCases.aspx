<%@ page title="" masterpagefile="~/ControlPanel/AdminPanel.master" language="C#" autoeventwireup="true" inherits="ControlPanel_NewManageCases, App_Web_zarixrtn" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
  
   <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
 
    
    <link href="css/Default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #directions-panel
        {
             height:291px;
            float: right;
            width: 390px;
            overflow: auto;
        }
        
        #map-canvas
        {
             width: 556px;
             height:291px;
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
       var someSession = '<%= Session["CaseID"].ToString() %>';
   

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
</script>


    <script  type="text/javascript">
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();

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

         
        }

     


        var start = '<%= Session["sBillingCode"].ToString() %>';
        var end = '<%= Session["sPostCode"].ToString() %>';
      
 
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
                                                                                                        <tr>
                                                                                                            <td height="5">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td height="25">
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td width="566">
                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <tr>
                                                                                                                                    <td class="map-bg">
                                                                                                                                     
                                                                                                                                        <div id="directions-panel">
                                                                                                                                        </div>
                                                                                                                                        <div id="map-canvas">
                                                                                                                                        </div>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </table>
                                                                                                                        </td>
                                                                                                                        <td width="10">
                                                                                                                            &nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="378" align="left" valign="top">
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
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                                                                                                                            Last Name::<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Maroon"
                                                                                                                            ControlToValidate="txtLastName" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                            ErrorMessage="*" ValidationGroup="validatePateintInfo"></asp:RequiredFieldValidator>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                              <asp:TextBox ID="txtLastName" runat="server" CssClass="field-220"></asp:TextBox>
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
                                                                                                            <td>
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td width="151" align="left">
                                                                                                                            <strong>Billing Details: </strong>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            &nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            <strong>Shipping Details: </strong>
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                            &nbsp;
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
                                                                                                                        <td width="151" align="left">
                                                                                                                            Billing Address:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtBillingAddress" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Shipping Address:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtShippingAddress" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Billing Post Code:&nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtBillingPostCode"  runat="server" CssClass="field-220" 
                                                                                                                            onchange="javascript:fnLoadCountry('1');"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        Shipping Post Code:&nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtShippingPostCode" runat="server" CssClass="field-220" 
                                                                                                                            onchange="javascript:fnLoadCountry('2');"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        Shipping Country:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:DropDownList ID="ddlShippingCountry" runat="server" CssClass="field-220">
                                                                                                                            <asp:ListItem Value="United States" Text="United States"></asp:ListItem>
                                                                                                                            <asp:ListItem Value="Canada" Text="Canada"></asp:ListItem>
                                                                                                                        </asp:DropDownList>
                                                                                                                    &nbsp;</td>
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
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        Shipping Phone:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtShippingPhone" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Billing Email:</td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtBillingEmail" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                            Shipping Email:&nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtShippingEmail" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                            <a href="#">
                                                                                 <asp:ImageButton ID="imgBtnPatientSave" ImageUrl="images/btn-save.png" runat="server"
                                                                                                                            OnClick="imgBtnPatientSave_Click" ValidationGroup="validatePateintInfo" CausesValidation="true" /></a>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                            <a href="#">
                                                                                <img src="images/btn-reset.png" width="63" height="25" /></a>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                                                                        <asp:ImageButton ID="imgBtnPatientCancel" ImageUrl="images/btn-cancel.png" runat="server"
                                                                                                                            
                                                                                OnClick="imgBtnPatientCancel_Click" CausesValidation="true" />
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
                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                        <tr>
                                                                                                            <td width="500" valign="top">
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <tr>
                                                                                                                                    <td width="151" align="left">
                                                                                                                                    Title:<asp:RequiredFieldValidator 
                                                                                                                                            ID="RequiredFieldValidator4" ForeColor="Maroon"
                                                                                                                                        ControlToValidate="txtDocumentTitle" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                                        ErrorMessage="*" ValidationGroup="validatePateintDocument"></asp:RequiredFieldValidator>
                                                                                                                                    </td>
                                                                                                                                    <td align="left">
                                                                                                                                    <asp:TextBox ID="txtDocumentTitle" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                                &nbsp;</td>
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
                                                                                                                                    Description:&nbsp;
                                                                                                                                    </td>
                                                                                                                                    <td align="left">
                                                                                                                                       <asp:TextBox ID="txtDocumentDescription" TextMode="MultiLine"  style="resize: none;"  runat="server" CssClass="field-220"
                                                                                                                                        Rows="5">
                                                                                                                                    </asp:TextBox>
                                                                                                                                       
                                                                                                                                      
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
                                                                                                                                    Upload Document:
                                                                                                                                    </td>
                                                                                                                                    <td align="left">
                                                                                                                                    
                                                                                                                                         <iframe frameborder="0" scrolling="no" height="50px" class="field-220" src="uploading.aspx?uploadType=CV"
                                                                                                                                        style="padding: 0px; width: 100%; background-color: Transparent;">[Your browser
                                                                                                                                        does not support frames] </iframe>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </table>
                                                                                                                        </td>

                                                                                                                    </tr>
                                                                                                                    <tr><td> <asp:Label ID="lblDocumentError" runat="server" Text="-" Visible="false"></asp:Label></td></tr>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td width="10">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td width="434" align="left" valign="top">
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox">
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
                                                                                                                                          <table width="478" class="grid" border="0" cellspacing="0" cellpadding="0">
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
                                                                                                                        <td style="width: 40px" class="grid-header">
                                                                                                                            Action
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </thead>
                                                                                                                <asp:ListView ID="lvDocument" runat="server" OnItemCommand="lvDocument_ItemCommand">
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
                                                                                                                                <asp:ImageButton ID="imgBtnEditDocuments" ImageUrl="images/icon-view-edit.png" CommandArgument='<%# Eval("iDocumentID")%>'
                                                                                                                                    CommandName="EditDocument" runat="server" />
                                                                                                                                &nbsp;
                                                                                                                                <asp:ImageButton ID="imgbtnDeleteDocuments" ImageUrl="images/icon-delete.png" CommandArgument='<%# Eval("iDocumentID")%>'
                                                                                                                                    CommandName="DeleteDocument" runat="server" />
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
                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                            </td>
                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td class="grid-bg-color grid-border-bottom">
                                                                                                                                <asp:ImageButton ID="imgBtnEditDocuments" ImageUrl="images/icon-view-edit.png" CommandArgument='<%# Eval("iDocumentID")%>'
                                                                                                                                    CommandName="EditDocument" runat="server" />
                                                                                                                                &nbsp;
                                                                                                                                <asp:ImageButton ID="imgbtnDeleteDocuments" ImageUrl="images/icon-delete.png" CommandArgument='<%# Eval("iDocumentID")%>'
                                                                                                                                    CommandName="DeleteDocument" runat="server" />
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
                                                                                                                                                <asp:ImageButton ID="imgbtnSaveFile" ImageUrl="images/btn-save.png" runat="server"
                                                                                                                                                    
                                                                                ValidationGroup="validatePateintDocument" CausesValidation="true" 
                                                                                                                                                    
                                                                                OnClick="imgbtnSaveFile_Click" />
                                                                                                                                           </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                            <a href="#">
                                                                                <img src="images/btn-reset.png" width="63" height="25" /></a>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                                                                                                <asp:ImageButton ID="imgbtnCancelFile" ImageUrl="images/btn-cancel.png" runat="server"
                                                                                                                                                    
                                                                                OnClick="imgbtnCancelFile_Click" CausesValidation="false" />
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
                                                                                                                                        Basic Question &amp; Answer
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
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtQADOB" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        <asp:CalendarExtender ID="CalendarExtender4" TargetControlID="txtQADOB" Enabled="true"
                                                                                                                            PopupPosition="BottomLeft" runat="server">
                                                                                                                        </asp:CalendarExtender>
                                                                                                                        &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        Sex:&nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:DropDownList ID="ddlQAGender" runat="server" CssClass="field-220">
                                                                                                                            <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                                                                                                            <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                                                                                                        </asp:DropDownList>
                                                                                                                    &nbsp;</td>
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
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        Past Condition:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtQAPastCondition" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Weight:&nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtQAWeight" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        Current Condition:</td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtQACurrentCondition" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Family Conditions:</td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtQAFamilyCondition" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        List Allergies?&nbsp;
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtQAAllegiesList" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Primary Physician:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:DropDownList ID="ddlPrimaryPhysician" CssClass="field-220" runat="server" AutoPostBack="True"
                                                                                                                            OnSelectedIndexChanged="ddlPrimaryPhysician_SelectedIndexChanged">
                                                                                                                        </asp:DropDownList>
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        Primary Physician Name:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtQAPrimaryPhysiican" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Physician Phone:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtPhysicianPhone" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="151" align="left">
                                                                                                                        Date Last Dr Visit
                                                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Maroon"
                                                                                                                            runat="server" ValidationGroup="validateGeneralQA" ControlToValidate="txtQALastDateVisit"
                                                                                                                            Enabled="true" SetFocusOnError="true" ErrorMessage="*" ToolTip="* Invalid date Format e.g. MM/DD/YYYY"
                                                                                                                            
                                                                                                                            
                                                                                                                                ValidationExpression="^((((0[13578])|([13578])|(1[02]))[\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\/](([1-9])|([0-2][0-9]))))[\/]\d{4}$|^\d{4}$"></asp:RegularExpressionValidator>
                                                                                                                        <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtQALastDateVisit"
                                                                                                                            Enabled="true" PopupPosition="BottomLeft" runat="server">
                                                                                                                        </asp:CalendarExtender>
                                                                                                                    &nbsp;</td>
                                                                                                                        <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtQALastDateVisit" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                        <asp:CalendarExtender ID="CalendarExtender5" TargetControlID="txtQALastDateVisit"
                                                                                                                            Enabled="true" PopupPosition="BottomLeft" runat="server">
                                                                                                                        </asp:CalendarExtender>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        <td width="151" height="25" align="left">
                                                                                                                            Do you smoke?
                                                                                                                        </td>
                                                                                                                        <td align="left">
                                                                                                                        <asp:CheckBox ID="chkbQASmoke" runat="server" />
                                                                                                                    &nbsp;</td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td height="25" align="left">
                                                                                                                            Smoke More Then 1 Pack?
                                                                                                                        </td>
                                                                                                                        <td align="left">
                                                                                                                        <asp:CheckBox ID="chkbQASmokeMoreThan1" runat="server" />
                                                                                                                    &nbsp;</td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td height="25" align="left">
                                                                                                                            Drink More Then 2 Drinks?
                                                                                                                        </td>
                                                                                                                        <td align="left">
                                                                                                                        <asp:CheckBox ID="chkbQADrinkMoreThan2" runat="server" />
                                                                                                                    &nbsp;</td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td height="25" align="left">
                                                                                                                            Pregnant?
                                                                                                                        </td>
                                                                                                                        <td align="left">
                                                                                                                           <asp:CheckBox ID="chkbQAPragnent" runat="server" />
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td height="25" align="left">
                                                                                                                            Plan to get Pregnant?
                                                                                                                        </td>
                                                                                                                        <td align="left">
                                                                                                                        <asp:CheckBox ID="chkbQAPlantoPragnent" runat="server" />
                                                                                                                    &nbsp;</td>
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
                                                                                                                        <asp:ImageButton ID="imgBtnSaveQA" 
                                                                                ImageUrl="images/btn-save.png" runat="server"
                                                                                                                            OnClick="imgBtnSaveQA_Click" CausesValidation="true" 
                                                                                                                            
                                                                                ValidationGroup="validateGeneralQA" />
                                                                                                                  </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                            <a href="#">
                                                                                <img src="images/btn-reset.png" width="63" height="25" /></a>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                                                                        <asp:ImageButton ID="imgBtnCancelQA" ImageUrl="images/btn-cancel.png" runat="server"
                                                                                                                            OnClick="imgBtnCancelQA_Click" 
                                                                                CausesValidation="false" />
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
                                                                                                                                        Detail Question &amp; Answer
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
                                                                                                            <td width="500" valign="top">
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <tr>
                                                                                                                                    <td width="151" align="left">
                                                                                                                                    Question:<asp:RequiredFieldValidator 
                                                                                                                                            ID="RequiredFieldValidator5" ForeColor="Maroon"
                                                                                                                                        ControlToValidate="txtDQAQuestion" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                                        ErrorMessage="*" ValidationGroup="validateDQA"></asp:RequiredFieldValidator>
                                                                                                                                &nbsp;</td>
                                                                                                                                    <td align="left">
                                                                                                                                    <asp:TextBox ID="txtDQAQuestion" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                                &nbsp;</td>
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
                                                                                                                                    Answer:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Maroon"
                                                                                                                                        ControlToValidate="txtDQAAnswer" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                                        ErrorMessage="*" ValidationGroup="validateDQA"></asp:RequiredFieldValidator>
                                                                                                                                &nbsp;</td>
                                                                                                                                    <td align="left">
                                                                                                                                        
                                                                                                                                   
                                                                                                                                    <asp:TextBox ID="txtDQAAnswer" TextMode="MultiLine" style="resize: none;"  runat="server" CssClass="field-220"
                                                                                                                                        Rows="5">
                                                                                                                                    </asp:TextBox>
                                                                                                                                   
                                                                                                                                   
                                                                                                                                   
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
                                                                                                                            &nbsp;
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td width="10">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td width="434" align="left" valign="top">
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox">
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
                                                                                                                             <table width="478" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                                                                <thead>
                                                                                                                    <tr>
                                                                                                                        <td style="width: 120px; height: 30px; padding-left: 5px;" class="grid-header">
                                                                                                                            Question
                                                                                                                        </td>
                                                                                                                        <td width="5" class="grid-header">
                                                                                                                        </td>
                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                        </td>
                                                                                                                        <td width="5" class="grid-header">
                                                                                                                        </td>
                                                                                                                        <td style="width: 150px" class="grid-header">
                                                                                                                            Answer
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
                                                                                                                <asp:ListView ID="lvDetailQA" runat="server" OnItemCommand="lvDetailQA_ItemCommand">
                                                                                                                    <LayoutTemplate>
                                                                                                                        <tbody>
                                                                                                                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                                                                        </tbody>
                                                                                                                    </LayoutTemplate>
                                                                                                                    <ItemTemplate>
                                                                                                                        <tr>
                                                                                                                            <td class="grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                                                                <span id="idiProductID" title='<%# Eval("sQuestion") %>'>
                                                                                                                                    <%# Eval("sQuestion")%></span>
                                                                                                                            </td>
                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                            </td>
                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td class="grid-border-bottom">
                                                                                                                                <span id="idsName" title='<%# Eval("sAnswer") %>'>
                                                                                                                                    <%# Eval("sAnswer")%></span>
                                                                                                                            </td>
                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                            </td>
                                                                                                                            <td width="5" class="grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td class="grid-border-bottom">
                                                                                                                                <asp:ImageButton ID="imgBtnEditQA" ImageUrl="images/icon-view-edit.png" CommandArgument='<%# Eval("iDetailQAID")%>'
                                                                                                                                    CommandName="EditQA" runat="server" />
                                                                                                                                &nbsp;
                                                                                                                                <asp:ImageButton ID="imgbtnDeleteQA" ImageUrl="images/icon-delete.png" CommandArgument='<%# Eval("iDetailQAID")%>'
                                                                                                                                    CommandName="DeleteQA" runat="server" />
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </ItemTemplate>
                                                                                                                    <AlternatingItemTemplate>
                                                                                                                        <tr>
                                                                                                                            <td class="grid-bg-color grid-border-bottom" style="height: 30px; padding-left: 5px">
                                                                                                                                <span id="idiProductID" title='<%# Eval("sQuestion") %>'>
                                                                                                                                    <%# Eval("sQuestion")%></span>
                                                                                                                            </td>
                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                            </td>
                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td class="grid-bg-color grid-border-bottom">
                                                                                                                                <span id="idsName" title='<%# Eval("sAnswer") %>'>
                                                                                                                                    <%# Eval("sAnswer")%></span>
                                                                                                                            </td>
                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td width="1" bgcolor="#CCCCCC">
                                                                                                                            </td>
                                                                                                                            <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                            </td>
                                                                                                                            <td class="grid-bg-color grid-border-bottom">
                                                                                                                                <asp:ImageButton ID="imgBtnEditQA" ImageUrl="images/icon-view-edit.png" CommandArgument='<%# Eval("iDetailQAID")%>'
                                                                                                                                    CommandName="EditQA" runat="server" />
                                                                                                                                &nbsp;
                                                                                                                                <asp:ImageButton ID="imgbtnDeleteQA" ImageUrl="images/icon-delete.png" CommandArgument='<%# Eval("iDetailQAID")%>'
                                                                                                                                    CommandName="DeleteQA" runat="server" />
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </AlternatingItemTemplate>
                                                                                                                    <EmptyItemTemplate>
                                                                                                                        <tr>
                                                                                                                            <td colspan="9">
                                                                                                                                No Question added yet
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </EmptyItemTemplate>
                                                                                                                </asp:ListView>
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
                                                                                                                                                <asp:ImageButton ID="imgBtnDQASave" ImageUrl="images/btn-save.png" runat="server"
                                                                                                                                                    
                                                                                OnClick="imgBtnDQASave_Click" ValidationGroup="validateDQA" 
                                                                                                                                                    
                                                                                CausesValidation="true" />
                                                                                                                                           </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                         
                                                                                <img src="images/btn-reset.png" width="63" height="25" />
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                                                                                                <asp:ImageButton ID="imgBtnDQACancel" ImageUrl="images/btn-cancel.png" runat="server"
                                                                                                                                                    
                                                                                OnClick="imgBtnDQACancel_Click" CausesValidation="false" />
                                                                                                                                        
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
                                                                                                                        <td>
                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <tr>
                                                                                                                                    <td width="151" align="left">
                                                                                                                        Doctor:<asp:RequiredFieldValidator 
                                                                                                                                            ID="RequiredFieldValidator7" ForeColor="Maroon"
                                                                                                                            ControlToValidate="txtOICaseDoctor" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                            ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtOICaseDoctor" runat="server" CssClass="field-220" 
                                                                                                                            Enabled="False"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                                    <td width="151" align="left">
                                                                                                                        Pharmacy:<asp:RequiredFieldValidator 
                                                                                                                                            ID="RequiredFieldValidator8" ForeColor="Maroon"
                                                                                                                            ControlToValidate="ddlOIPharmacy111" Enabled="true" InitialValue="-1" SetFocusOnError="true"
                                                                                                                            runat="server" ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:DropDownList ID="ddlOIPharmacy111" runat="server" CssClass="field-220">
                                                                                                                        </asp:DropDownList>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Tracking No:<asp:RequiredFieldValidator 
                                                                                                                                            ID="RequiredFieldValidator9" ForeColor="Maroon"
                                                                                                                            ControlToValidate="txtOITrackingNo" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                            ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtOITrackingNo" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                                    <td width="151" align="left">
                                                                                                                        Discount:<asp:RequiredFieldValidator 
                                                                                                                                            ID="RequiredFieldValidator10" ForeColor="Maroon"
                                                                                                                            ControlToValidate="txtOIDiscount" Enabled="true" SetFocusOnError="true" runat="server"
                                                                                                                            ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"
                                                                                                                            runat="server" ErrorMessage="*" ControlToValidate="txtOIDiscount" 
                                                                                                                            ValidationGroup="validateOrderInformation"></asp:RegularExpressionValidator>
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtOIDiscount" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Gift Certificates:
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtOIGiftCertificate" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                                    <td width="151" align="left">
                                                                                                                        Handling
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtOIHandling" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Shipping:
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtOIShipping" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                                    <td width="151" align="left">
                                                                                                                                        Billing Email:
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                                        <input name="textfield97" type="text" class="field-220" id="textfield913" />
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </table>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td height="15">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <tr>
                                                                                                                                    <td width="151" align="left">
                                                                                                                                        <strong>Add Products </strong>
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
                                                                                                                    <tr>
                                                                                                                        <td height="15">
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <tr>
                                                                                                                                    <td width="151" align="left">
                                                                                                                        Select Product:<asp:RequiredFieldValidator 
                                                                                                                                            ID="RequiredFieldValidator11" ForeColor="Maroon"
                                                                                                                            ControlToValidate="ddlOIProducts" Enabled="true" InitialValue="-1" SetFocusOnError="true"
                                                                                                                            runat="server" ErrorMessage="*" ValidationGroup="validateOrderInformation"></asp:RequiredFieldValidator>
                                                                                                                    &nbsp;</td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:DropDownList ID="ddlOIProducts" CssClass="field-220" runat="server" AutoPostBack="True"
                                                                                                                            OnSelectedIndexChanged="ddlOIProducts_SelectedIndexChanged">
                                                                                                                        </asp:DropDownList>
                                                                                                                    &nbsp;</td>
                                                                                                                                    <td width="151" align="left">
                                                                                                                        Product Code:&nbsp;
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:Label ID="lblOIProductCode" runat="server" Text="Item-Code"></asp:Label>
                                                                                                                    &nbsp;</td>
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
                                                                                                                        Item Price&nbsp;
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtOIItemPrice" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                                    <td width="151" align="left">
                                                                                                                        Quantity:&nbsp;
                                                                                                                                    </td>
                                                                                                                                    <td width="327" align="left">
                                                                                                                        <asp:TextBox ID="txtOIQty" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    &nbsp;</td>
                                                                                                                                </tr>
                                                                                                                            </table>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                         
                                                                                                                    </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                        <td align="center">
                                                                                                                &nbsp;&nbsp;
                                  <asp:Button ID="Button1"  runat="server"   style="background: url(images/btn-save.png); width: 63px; height: 25px " OnClick="btnAddProduct_Click"  CausesValidation="true"    ValidationGroup="validateOrderInformation" />
                                  <asp:Button ID="Button2"  runat="server"  style="background: url(images/btn-cancel.png); width: 63px; height: 25px "  OnClick="btnCancelProduct_Click" CausesValidation="false" />
                                                                                                                                
                                                                          
                                                                                
                                                                     <%--  <asp:ImageButton ID="btnAddProduct" ImageUrl="images/btn-save.png"  width="63" height="25"  runat="server" 
                                                                                                                    OnClick="btnAddProduct_Click" ValidationGroup="validateDQA"  
                                                                                                                    CausesValidation="true" />
                                                                                                                                            
                                                                                <img src="images/btn-reset.png" width="63" height="25" />
                                                                                <asp:ImageButton ID="btnCancelProduct" 
                                                                                                                    ImageUrl="images/btn-cancel.png"   width="63" height="25"  runat="server" 
                                                                                                                    OnClick="btnCancelProduct_Click" CausesValidation="false" />--%>
                                                                                                                                            
                                                                              </td>
                                                        </tr>

                                                                               <tr>
                                                                                               <td>
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox">
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
                                                                                                                            <asp:ListView ID="lvProductsList" runat="server" OnItemCommand="lvProductsList_ItemCommand">
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
                                                                                                                                        <td width="5" class="grid-border-bottom">
                                                                                                                                        </td>
                                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-border-bottom">
                                                                                                                                        </td>
                                                                                                                                        <td class="grid-border-bottom">
                                                                                                                                            <asp:ImageButton ID="imgBtnEditQA" ImageUrl="images/icon-view-edit.png" CommandArgument='<%# Eval("iOrderDetailID")%>'
                                                                                                                                                CommandName="EditProduct" runat="server" />
                                                                                                                                            &nbsp;
                                                                                                                                            <asp:ImageButton ID="imgbtnDeleteQA" ImageUrl="images/icon-delete.png" CommandArgument='<%# Eval("iOrderDetailID")%>'
                                                                                                                                                CommandName="DeleteProduct" runat="server" />
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
                                                                                                                                        <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                        </td>
                                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                        </td>
                                                                                                                                        <td class="grid-bg-color grid-border-bottom">
                                                                                                                                            <asp:ImageButton ID="imgBtnEditQA" ImageUrl="images/icon-view-edit.png" CommandArgument='<%# Eval("iOrderDetailID")%>'
                                                                                                                                                CommandName="EditProduct" runat="server" />
                                                                                                                                            &nbsp;
                                                                                                                                            <asp:ImageButton ID="imgbtnDeleteQA" ImageUrl="images/icon-delete.png" CommandArgument='<%# Eval("iOrderDetailID")%>'
                                                                                                                                                CommandName="DeleteProduct" runat="server" />
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
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                &nbsp;
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
                                                                                                        &nbsp;</td>
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
                                                                                                        &nbsp;</td>
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
                                                                                                                            Comments:
                                                                                                                        </td>
                                                                                                                        <td width="327" align="left">
                                                                                                                           
                                                                                                                                                                                                                                        <asp:TextBox ID="txtOSComments" TextMode="MultiLine"  style="resize: none;"  Rows="5" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                        
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
                                                                            <a href="#">
                                                                          
                                                                                
                                                                      <asp:ImageButton ID="imgbtnOISave" ImageUrl="images/btn-save.png" width="63" height="25"  runat="server"
                                                                                                                            OnClick="imgbtnOISave_Click" />                                                              
                                                                                </a>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                            <a href="#">
                                                                                <img src="images/btn-reset.png" width="63" height="25" /></a>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                           <asp:ImageButton ID="imgbtnOICancel" ImageUrl="images/btn-cancel.png" width="63" height="25"  runat="server"
                                                                                                                            OnClick="imgbtnOICancel_Click" />                                                           
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
                                                                                                                                        Doctor's Instrustions:
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
                                                                                                            <td width="500" valign="top">
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <tr>
                                                                                                                                    <td width="151" align="left" valign="top">
                                                                                                                                        Doctor's Instrustions:
                                                                                                                                    </td>
                                                                                                                                    <td align="left">
                                                                                                                             
                                                                                                                                  
                                                                                                                                  
                                                                                                                          <asp:TextBox ID="txtDIDocInstructions" Rows="9" style="resize: none;" TextMode="MultiLine"  runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                    
                                                                                                                                  
                                                                                                                                  
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
                                                                                                                                        Doctor's Notes:
                                                                                                                                    </td>
                                                                                                                                    <td align="left">
                                                                                                                                    <asp:TextBox ID="txtDIDocNotes" runat="server" CssClass="field-220"></asp:TextBox>
                                                                                                                                &nbsp;</td>
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
                                                                                                                            &nbsp;
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td width="10">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td width="434" align="left" valign="top">
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox">
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
                                                                                                                            <asp:ListView ID="lvNotes" runat="server" OnItemCommand="lvDetailQA_ItemCommand">
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
                                                                                                                                        <td width="5" class="grid-border-bottom">
                                                                                                                                        </td>
                                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-border-bottom">
                                                                                                                                        </td>
                                                                                                                                        <td class="grid-border-bottom">
                                                                                                                                            <asp:ImageButton ID="imgBtnEditQA" ImageUrl="images/icon-view-edit.png" CommandArgument='<%# Eval("iCaseNoteID")%>'
                                                                                                                                                CommandName="EditNote" runat="server" />
                                                                                                                                            &nbsp;
                                                                                                                                            <asp:ImageButton ID="imgbtnDeleteQA" ImageUrl="images/icon-delete.png" CommandArgument='<%# Eval("iCaseNoteID")%>'
                                                                                                                                                CommandName="DeleteNote" runat="server" />
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
                                                                                                                                        <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                        </td>
                                                                                                                                        <td width="1" bgcolor="#CCCCCC">
                                                                                                                                        </td>
                                                                                                                                        <td width="5" class="grid-bg-color grid-border-bottom">
                                                                                                                                        </td>
                                                                                                                                        <td class="grid-bg-color grid-border-bottom">
                                                                                                                                            <asp:ImageButton ID="imgBtnEditQA" ImageUrl="images/icon-view-edit.png" CommandArgument='<%# Eval("iCaseNoteID")%>'
                                                                                                                                                CommandName="EditNote" runat="server" />
                                                                                                                                            &nbsp;
                                                                                                                                            <asp:ImageButton ID="imgbtnDeleteQA" ImageUrl="images/icon-delete.png" CommandArgument='<%# Eval("iCaseNoteID")%>'
                                                                                                                                                CommandName="DeleteNote" runat="server" />
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
                                                                            <a href="#">
 
                                                                         <asp:ImageButton ID="btnAddNote" ImageUrl="images/btn-save.png"  width="63" height="25"  runat="server" OnClick="btnAddNote_Click" ValidationGroup="validateDQA"  CausesValidation="true" />
                                                                                    
                                                                                </a>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="63" align="left">
                                                                            <a href="#">
                                                                                <img src="images/btn-reset.png" width="63" height="25" /></a>
                                                                        </td>
                                                                        <td align="left">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td  width="63" align="left">
                                                                                <asp:ImageButton ID="btnCancelNote" ImageUrl="images/btn-cancel.png"   width="63" height="25"  runat="server" OnClick="btnCancelNote_Click" CausesValidation="false" />
                                                                                 
                                                                                                             
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
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            &nbsp;
                                                                                                <asp:HiddenField ID="hfBillingPostCode"   runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
