<%@ page title="" language="C#" autoeventwireup="true" inherits="ControlPanel_GoogleMapMarker, App_Web_x5lf5vqe" %>

 <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Show/Add multiple markers to Google Maps in asp.net website</title>
<style type="text/css">
html { height: 100% }
body { height: 100%; margin: 0; padding: 0 }
#map_canvas { height: 100% }
</style>

<script type="text/javascript" src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">
</script>

<script type="text/javascript">



    function fnIn()
     {

        var markers = [
{
    "title": "Lahore",
    "lat": 12.897489183755905,
    "lng": 80.2880859375,
    "description": "Lahore"
},
{
    "title": "Peshawer",
    "lat": 17.26672782352052,
    "lng": 78.5302734375,
    "description": "Peshawer"
},
{
    "title": "Bangalore",
    "lat": 12.897489183755905,
    "lng": 77.51953125,
    "description": "Bangalore"
},
{
    "title": "visakhapatnam",
    "lat": 17.518344187852207,
    "lng": 83.3203125,
    "description": "visakhapatnam"
}];
    
initialize(markers);
    }



    function initialize(markers) {

        var mapOptions = {
            center: new google.maps.LatLng(11.44, 78.79),
            zoom: 5,
            mapTypeId: google.maps.MapTypeId.ROADMAP
           
        };
        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: data.title
            });
            (function (marker, data) {

                // Attaching a click event to the current marker
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(data.description);
                    infoWindow.open(map, marker);
                });
            })(marker, data);
        }
    }

    function makeIcon(image) {
        var icon = new GIcon();
        icon.image = image;
        icon.shadow = "images/stethoscope.png";
        icon.iconSize = new GSize(16, 16);
        icon.shadowSize = new GSize(24, 16);
        icon.iconAnchor = new GPoint(8, 16);
        icon.infoShadowAnchor = new GPoint(0, 0);
        icon.infoWindowAnchor = new GPoint(8, 1);
        return icon;
    }

</script>
</head>
<body >
 
<form id="form1" runat="server">
<input id="Button2" type="button" value="button" onclick="fnIn()" /><asp:Button ID="Button1" runat="server" OnClientClick="fnIn()" Text="Button" />
<div id="map_canvas" style="width: 500px; height: 400px"></div>
</form>
</body>
</html>