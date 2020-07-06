<%@ page language="C#" title="" masterpagefile="~/UserPanels/Pharmasist.master" autoeventwireup="true" inherits="UserPanels_PharmasistDashBoard, App_Web_sesurbpw" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        var idsPostCode, idiAdminCompanyID, isValidPostCode;


        window.onload = function () {




            idiAdminCompanyID = '<%=Session["iAdminCompanyID"].ToString()%>';

            fnLoadMarkers();
        }


      
        function fnLoadMarkers() {
     

          
         
                hfPostCode.value = "";
                idsPostCode = '<%=Session["sPostcode"].ToString()%>';
                idsContactID = '<%=Session["iContactID"].ToString()%>';
     

      
            idiAdminCompanyID = document.getElementById("<%= idiAdminCompanyID.ClientID %>").value;


            $.ajax({
                type: "POST",
                url: "../LinezWS_WHCS.asmx/fnSearchOnPostcodeForPharmasist",

                data: "{'iContactID':'" + idsContactID + "','sPostCode':'" + idsPostCode + "', 'iAdminCompanyID':'" + idiAdminCompanyID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result != "")
                    { initialize(jQuery.parseJSON(result)) }
                    else if (result == "")
                    { }

                    else if (result == "0") { alert('There is some propblem in Saving records'); }
                    else if (result == "3") { alert('Invalid ZipCode/PostCode'); }
                },
                failure: function (msg) { alert(msg); }
            });
            return false;
        }
        //        }





        function initialize(markers) {

            if (markers.length > 0) {

                var myLocation = markers[markers.length - 1];

                var myLocationLatlng = new google.maps.LatLng(myLocation.lat, myLocation.lng);

                var mapOptions = {
                    center: new google.maps.LatLng(myLocation.lat, myLocation.lng),
                    // position: myLocationLatlng,
                    zoom: 3,
                    mapTypeId: google.maps.MapTypeId.ROADMAP

                };




                var infoWindow = new google.maps.InfoWindow();
           
                var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
                for (i = 0; i < markers.length; i++) {

                    var data = markers[i];
                    if (data.locationType != null) {
                       
                   if (data.locationType.toString() == 'Pharmasist')
                            image = '../ControlPanel/images/Pharmacy-icon.png';

                      

                        else if (data.locationType.toString() == 'MyLocation')
                            image = '../ControlPanel/images/location.png';


                        var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                        var marker = new google.maps.Marker({
                            position: myLatlng,
                            map: map,
                            title: data.title,
                            icon: image

                        });


//                        var sunCircle = {
//                            strokeColor: "#808080",
//                            strokeOpacity: 0.2,

//                            strokeWeight: 2,
//                            fillColor: "#808080",
//                            fillOpacity: 0.2,
//                            map: map,
//                            center: myLocationLatlng,
//                            radius: 24140.2
//                        };
//                        cityCircle = new google.maps.Circle(sunCircle);


                        (function (marker, data) {


                            google.maps.event.addListener(marker, "click", function (e) {
                                infoWindow.setContent(data.description);
                                infoWindow.open(map, marker);
                            });
                        })(marker, data);
                    }
                }
            }


        }
    </script>
    <table border="0" cellspacing="0" cellpadding="0" width="968">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="349" align="left" valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="dashboard-map-bg">
                                                    <%--   <img src="images/map.jpg" width="339" height="273" />--%>
                                                    <div id="map_canvas" style="width: 339px; height: 273px">
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="8">
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="dashboadr-box-header-bg">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="8" height="40" align="left">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left">
                                                                Linked Venue
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="dashboadr-box-detail">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="8">
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td width="8" height="10">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="247">
                                                                            <asp:ListView ID="lstLinkedVenues" runat="server" >
                                                                                <LayoutTemplate>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <%--      <td width="232" align="left" class="grid-header">
                                                                                    Company Id
                                                                                </td>--%>
                                                                                            <td height="30" width="5" class="grid-header">
                                                                                            </td>
                                                                                            <td width="262" align="left" class="grid-header">
                                                                                                Address
                                                                                            </td>
                                                                                             <td height="30" width="5" class="grid-header">
                                                                                            </td>
                                                                                            <td width="262" align="left" class="grid-header">
                                                                                       PostCode
                                                                                            </td>
                                                                                             <td height="30" width="5" class="grid-header">
                                                                                            </td>
                                                                                            <td width="262" align="left" class="grid-header">
                                                                                             View
                                                                                            </td>
                                                                                            <td width="5" class="grid-header">
                                                                                            </td>
                                                                                            <td width="1" bgcolor="#CCCCCC">
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
                                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("sLocationName")%>' ></asp:Label>
                                                                                                    </td>

                                                                                                     <td class="grid-bg-color grid-border-bottom"></td>
                                                                                                    <td height="30" class="grid-bg-color grid-border-bottom">
                                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("sPostCode")%>' ></asp:Label>
                                                                                                    </td>
                                                                                                     <td class="grid-bg-color grid-border-bottom">
                                                                                                    </td>
                                                                                                    <td width="1" bgcolor="#CCCCCC">
                                                                                                    </td>
                                                                                                    
                                                                                                </tr>
                                                        
                                                                                        </ContentTemplate>
                                                                                    </asp:UpdatePanel>
                                                                                </ItemTemplate>
                                            
                                                                            </asp:ListView>
                                                                            <%-- <input type="text" name="textfield2" class="dashboard-venu-field" />--%>
                                                                            <%--<asp:TextBox ID="txtPostCode" runat="server" CssClass="dashboard-venu-field" placeholder="U.S/Canada PostCode" onblur="javascript:fnLoadCountry()"></asp:TextBox>--%>
                                                                        </td>
                                                                        <td width="4">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="72">
                                                                            <%--   <input name="Submit" type="submit" class="dasboard-btn" value="Submit" />--%>
                                                                            <%--<asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="dasboard-btn" OnClick="btnSearch_Click" />--%>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10">
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td width="10" height="10">
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
                        <td width="15" align="left" valign="top">
                            &nbsp;
                        </td>
                        <td width="604" align="left" valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td align="left" class="dashboard-heading">
                                        Welcome To Wheel HealthCare Services Inc!
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="dashboard-border">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td class="dashboard-navi">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="146" align="left" valign="top">
                                                                                        <a href="../UserPanels/PharmasistProfile.aspx" title="My Profile" alt="My Profile">
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td height="15" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="31" align="center" valign="middle">
                                                                                                        <a href="../UserPanels/PharmasistProfile.aspx">
                                                                                                            <img src="../ControlPanel/images/icon-myprofile.png" width="32" height="26" /></a>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="10" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="center">
                                                                                                        My Profile
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="15" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </a>
                                                                                    </td>
                                                                                    <td width="1" align="left" valign="top" bgcolor="#E4E4E4">
                                                                                    </td>
                                                                                    <td width="146" align="left" valign="top">
                                                                                        <a href="../UserPanels/PharmasistProductType.aspx" title="My Product Types" alt="My Product Types">
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td height="15" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="31" align="center" valign="middle">
                                                                                                        <a href="../UserPanels/PharmasistProductType.aspx">
                                                                                                            <img src="../ControlPanel/images/icon-type.png" width="27" height="27" /></a>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="10" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="center">
                                                                                                        My Product Types
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="15" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </a>
                                                                                    </td>
                                                                                    <td width="1" align="left" valign="top" bgcolor="#E4E4E4">
                                                                                    </td>
                                                                                    <td width="146" align="left" valign="top">
                                                                                        <a href="../UserPanels/PharmasistProducts.aspx" title="My Products" alt="My Products">
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td height="15" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="31" align="center" valign="middle">
                                                                                                        <a href="../UserPanels/PharmasistProducts.aspx">
                                                                                                            <img src="../ControlPanel/images/icon-product.png" width="32" height="27" /></a>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="10" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="center">
                                                                                                        My Products
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="15" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </a>
                                                                                    </td>
                                                                                    <td width="1" align="left" valign="top" bgcolor="#E4E4E4">
                                                                                    </td>
                                                                                    <td width="144" align="left" valign="top">
                                                                                        <a href="../UserPanels/PharmasistDocuments.aspx" title="My Document" alt="My Document">
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                           <tr>
                                                                                                    <td height="15" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="center">
                                                                                                        <img src="../ControlPanel/images/icon-mydocument.png" width="32" height="31" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="10" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="center">
                                                                                                        My Document
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td height="15" align="center">
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </a>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="8">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td class="dashboadr-box-header-bg">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="8" height="40" align="left">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td align="left">
                                                                                        New Feeds
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <table width="100%" class="grid" border="0" cellspacing="0" cellpadding="0">
                                                                                <asp:ListView ID="lstNewsFeeds" runat="server">
                                                                                    <LayoutTemplate>
                                                                                        <tbody>
                                                                                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                                                                        </tbody>
                                                                                    </LayoutTemplate>
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td class="dashboadr-box-detail">
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="8">
                                                                                                        </td>
                                                                                                        <td>
                                                                                                        </td>
                                                                                                        <td width="8" height="10">
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
                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                            <tr>
                                                                                                                                <td width="500">
                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                        <tr>
                                                                                                                                            <td class="dashboard-feed">
                                                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                    <tr>
                                                                                                                                                        <td class="dashboard-feed-inner">
                                                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                                <tr>
                                                                                                                                                                    <td width="10" height="10">
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
                                                                                                                                                                    <td>
                                                                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                                            <tr>
                                                                                                                                                                                <td width="52" align="left" valign="top">
                                                                                                                                                                                    <img alt="" src='../ImageStorage/<%# Eval("sImageName")%>' width="50" height="51" />
                                                                                                                                                                                </td>
                                                                                                                                                                                <td width="10">
                                                                                                                                                                                    &nbsp;
                                                                                                                                                                                </td>
                                                                                                                                                                                <td>
                                                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                                                        <tr>
                                                                                                                                                                                            <td align="left">
                                                                                                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                                                                    <tr>
                                                                                                                                                                                                        <td align="left" class="dashboard-heading-12">
                                                                                                                                                                                                            <span id="idsNewsTitle" title='<%# Eval("sNewsTitle") %>'>
                                                                                                                                                                                                                <%# Eval("sNewsTitle") %></span>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                    </tr>
                                                                                                                                                                                                    <tr>
                                                                                                                                                                                                        <td align="left">
                                                                                                                                                                                                            &nbsp;
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                    </tr>
                                                                                                                                                                                                    <tr>
                                                                                                                                                                                                        <td align="left">
                                                                                                                                                                                                            <span id="idsNewsDescription" title='<%# Eval("sNewsDescription") %>'>
                                                                                                                                                                                                                <%# Eval("sNewsDescription")%></span>
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
                                                                                                                                        </tr>
                                                                                                                                    </table>
                                                                                                                                </td>
                                                                                                                                <td width="50" align="right" valign="top">
                                                                                                                                    <table width="40" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                        <tr>
                                                                                                                                            <td align="center" class="dasboard-date">
                                                                                                                                                <span id="day" title='<%# Eval("day") %>'>
                                                                                                                                                    <%# Eval("day")%></span>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td class="bg-date">
                                                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                    <tr>
                                                                                                                                                        <td height="2" align="center">
                                                                                                                                                        </td>
                                                                                                                                                    </tr>
                                                                                                                                                    <tr>
                                                                                                                                                        <td align="center">
                                                                                                                                                            <span id="month" title='<%# Eval("date")%>  <%# Eval("month") %>'>
                                                                                                                                                                    <%# Eval("date")%><%# Eval("month")%></span>
                                                                                                                                                        </td>
                                                                                                                                                    </tr>
                                                                                                                                                    <tr>
                                                                                                                                                        <td height="1" align="center">
                                                                                                                                                        </td>
                                                                                                                                                    </tr>
                                                                                                                                                    <tr>
                                                                                                                                                        <td align="center" height="3px">
                                                                                                                                                            <span id="date" title='<%# Eval("year") %>'>
                                                                                                                                                           
                                                                                                                                                                <%# Eval("year") %></span>
                                                                                                                                                        </td>
                                                                                                                                                    </tr>
                                                                                                                                                    <tr>
                                                                                                                                                        <td height="1" align="center">
                                                                                                                                                        </td>
                                                                                                                                                    </tr>
                                                                                                                                                    <tr>
                                                                                                                                                        <td height="2" align="center">
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
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="10">
                                                                                                        </td>
                                                                                                        <td>
                                                                                                        </td>
                                                                                                        <td width="10" height="">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                <tr>
                                                                                                </tr>
                                                                                    </ItemTemplate>
                                                                                </asp:ListView>
                                                                                <tfoot class="paging">
                                                                                </tfoot>
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
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HiddenField ID="idiAdminCompanyID" runat="server" />
                <asp:HiddenField ID="hfNewsFeedID" ClientIDMode="Static" runat="server" />
                <asp:HiddenField ID="hfPostCode" ClientIDMode="Static" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
