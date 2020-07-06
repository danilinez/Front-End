<%@ page title="" masterpagefile="~/ControlPanel/AdminPanel.master" language="C#" autoeventwireup="true" inherits="ControlPanel_SearchAppointments, App_Web_zarixrtn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        html
        {
            height: 100%;
        }
        body
        {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        #map_canvas
        {
            height: 100%;
        }
    </style>

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">
    </script>

    <script type="text/javascript">

        var newEntry;
        var row;
        var idsPostCode, idsRadius, idiAdminCompanyID, isValidPostCode;

        function fnLoadCountry() {
            var postCode = document.getElementById("<%= txtPostCode.ClientID %>");
            postCode.value = postCode.value.replace(/\s/g, '');

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
                        isValidPostCode = 0;
                    }
                    else
                        isValidPostCode = 1;


                },
                failure: function (msg) {
                    alert(msg);
                }

            });
            return false;

        }
        function fnLoadMarkers() {
        
            idsPostCode = document.getElementById("<%= txtPostCode.ClientID %>").value;
            idsRadius = document.getElementById("<%= txtDistance.ClientID %>").value;
            idiAdminCompanyID = document.getElementById("<%= idiAdminCompanyID.ClientID %>").value;

            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnSearchOnPostcodeRadius",

                data: "{'sPostCode':'" + idsPostCode + "', 'sRadius':'" + idsRadius + "', 'iAdminCompanyID':'" + idiAdminCompanyID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result != "")
                    { initialize(jQuery.parseJSON(result), idsRadius) }
                    else if (result == "")
                    { }

                    else if (result == "0") { alert('There is some propblem in Saving records'); }
                    else if (result == "3") { alert('Invalid ZipCode/PostCode'); }
                },
                failure: function (msg) { alert(msg); }
            });
            return false;
        }


        function initialize(markers, iradius) {

          if (markers.length > 0) {

                var myLocation = markers[markers.length - 1];

               var myLocationLatlng = new google.maps.LatLng(myLocation.lat, myLocation.lng);

                var mapOptions = {
                    center: new google.maps.LatLng(myLocation.lat, myLocation.lng),
                // position: myLocationLatlng,
                    zoom: 8,
                    mapTypeId: google.maps.MapTypeId.ROADMAP

                };

               


                var infoWindow = new google.maps.InfoWindow();
               var image = 'images/doctor-icon.png';
                var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
                for (i = 0; i < markers.length; i++) {
                    var data = markers[i]

                    if (data.locationType.toString() == 'Doctor')
                        image = 'images/doctor-icon.png';
                    else if (data.locationType.toString() == 'MyLocation')
                        image = 'images/location.png';

                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                     position: myLatlng,
                        map: map,
                        title: data.title,
                        icon: image

                    });


                    var sunCircle = {
                        strokeColor: "#808080",
                        strokeOpacity: 0.2,

                        strokeWeight: 2,
                        fillColor: "#808080",
                        fillOpacity: 0.2,
                        map: map,
                        center: myLocationLatlng,
                        radius: parseFloat(iradius) * 1609.34
                    };
                    cityCircle = new google.maps.Circle(sunCircle);
                    //cityCircle.bindTo('center', marker, 'position');

                    (function (marker, data) {

                        // Attaching a click event to the current marker
                        google.maps.event.addListener(marker, "click", function (e) {
                            infoWindow.setContent(data.description);
                            infoWindow.open(map, marker);
                        });
                    })(marker, data);
                }
            }
         
        }
    </script>

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
                                        <asp:HiddenField ID="idiAdminCompanyID" runat="server" />
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
                                                            <td colspan="30">
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
                                                                                        Find Booked Appointments Location
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
                                                                            Expert Surname:
                                                                        </td>
                                                                        <td width="327" align="left">
                                                                            <%--  <input name="textfield2" type="text" class="field-220" id="textfield2" />--%>
                                                                            <asp:TextBox ID="txtDoctorName" class="field-220" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td width="151" align="left">
                                                                            Post Code:
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                                                                InitialValue="-1" ControlToValidate="txtPostCode" ValidationGroup="grpAppointments"></asp:RequiredFieldValidator>
                                                                            <%-- <asp:RegularExpressionValidator runat="server" ID="regZipCode" ControlToValidate="txtPostCode"
                                                                                ValidationExpression="^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$" Display="dynamic"
                                                                                ErrorMessage="*USA Formate 85123,Canada formate R2G 1T9">

                                                                            </asp:RegularExpressionValidator>--%>
                                                                        </td>
                                                                        <td width="327" align="left">
                                                                            <%--  <input name="textfield3" type="text" class="field-220" id="textfield3" />--%>
                                                                            <asp:TextBox ID="txtPostCode" class="field-220" runat="server" onblur="javascript:fnLoadCountry()"></asp:TextBox>
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
                                                                            Maximum Radius (Miles):
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                                                                InitialValue="-1" ControlToValidate="txtDistance" ValidationGroup="grpValidateCompany"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td width="327" align="left">
                                                                            <%-- <input name="textfield4" type="text" class="field-220" id="textfield4" />--%>
                                                                            <asp:TextBox ID="txtDistance" class="field-220" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td width="151" align="left">
                                                                            &nbsp;
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
                                    <%--   <img src="images/btn-save.png" width="63" height="25" /> <img src="images/btn-cancel.png" width="63" height="25" /><img src="images/btn-reset.png" width="63" height="25" />--%>
                                    <td width="63" align="left">
                                        <asp:Button ID="btnSearch" CssClass="default_button_3" runat="server" Text="Search"
                                            CausesValidation="true" OnClick="btnSearch_Click" ValidationGroup="grpAppointment" />
                                        <%--OnClientClick="fnLoadMarkers(this); return false;"--%>
                                    </td>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                    <td width="63" align="left">
                                        <asp:Button ID="btnFindAll" CssClass="default_button_3" runat="server" Text="Find All Appointment(s)"
                                            CausesValidation="true" OnClick="btnFindAll_Click" style="display:none;" />
                                        <%--   <asp:ImageButton ID="btnSearchApp" ImageUrl="images/btn-find-appointment.png" runat="server"
                                                                        CommandArgument='<%# Eval("iVenueID")%>' CommandName="FindAllApp" />--%>
                                    </td>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                    <td width="63" align="left">
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
        <tr>
            <td height="5px">
            </td>
        </tr>
    </table>
    <table width="968" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mainboxheading">
                    <tr>
                        <td height="3px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="968" border="0" cellspacing="0" cellpadding="0">
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
                                                    Results
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
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="grid">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr><td height="5px"></td></tr>
            <tr>
            <td align="left" valign="top">
                <asp:ListView ID="lstSearchAppointment" runat="server" GroupItemCount="2" GroupPlaceholderID="groupPlaceHolder1"
                    ItemPlaceholderID="itemPlaceHolder1" OnItemCommand="lstViewItems_ItemCommand"
                    OnItemDataBound="lstViewItems_ItemDataBound" OnSelectedIndexChanged="lstSearchAppointment_SelectedIndexChanged">
                    <LayoutTemplate>
                        <table>
                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                        </table>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <td width="224" align="left" valign="top">
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
                                                                            <span>
                                                                                <%# Eval("DoctorName") %>
                                                                            </span></span>
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
                                    <td class="grid">
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
                                                            <td height="18" align="left">
                                                                <strong>Address:</strong><span>
                                                                    <%# Eval("sPostCode")%></span> <strong>-</strong><span>
                                                                        <%# Eval("sLocationName")%></span> <strong>-</strong><span>
                                                                            <%# Eval("Distance1")%></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="18" align="left">
                                                                <strong>Email: </strong><span>
                                                                    <%# Eval("sEmail")%></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="18" align="left">
                                                                <strong>Phone: </strong><span>
                                                                    <%# Eval("sPhoneNumber")%></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="18" align="center">
                                                                <a href="#">
                                                                    <%--  <img src="images/btn-find-appointment.png" width="148" height="37" border="0" /></a>--%>
                                                                    <asp:ImageButton ID="btnSearchApp" ImageUrl="images/btn-find-appointment.png" runat="server"
                                                                        CommandArgument='<%# Eval("iVenueID")%>' CommandName="SearchDateAppointment" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="5">
                                                </td>
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
                        <td width="15" align="left" valign="top">
                            &nbsp;
                        </td>
                    </ItemTemplate>
                </asp:ListView>
            
            </td>

           <td align="center" valign="top">
                <div id="map_canvas" style="width: 500px; height: 400px">
                </div>
            </td>
            </tr></table>
            </td>
        </tr>

       
       
        <tr>
            <td height="15px">
            </td>
        </tr>
    </table>
</asp:Content>
