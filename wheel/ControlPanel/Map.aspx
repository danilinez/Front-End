<%@ page language="C#" autoeventwireup="true" inherits="ControlPanel_Map, App_Web_x5lf5vqe" %>

<%--<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=false">
</script>
<script type="text/javascript">
    function initialize() {
        var position = new google.maps.LatLng(-34.397, 150.644);
        var myOptions = {
            zoom: 10,
            center: position,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(
        document.getElementById("map_canvas"),
        myOptions);

        var marker = new google.maps.Marker({
            position: position,
            map: map,
            title: "This is the place."
        });

        var contentString = 'Hello <strong>World</strong>!';
        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });

        google.maps.event.addListener(marker, 'click', function () {
            infowindow.open(map, marker);
        });

    }
 
</script>
</head>
<body onload="initialize()">
  <div id="map_canvas" style="width:500px; height:500px"></div>
</body>
</html>--%>
<%--<html>
<head runat="server">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

<title>Google Map 3.0</title>
<style type="text/css">
.formatText{color:Green;font-size:11px;font-family:Arial;font-weight:bold;}
</style>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
var map;
function initialize() {
var myLatlng = new google.maps.LatLng(40.764015, -73.982797);
var myOptions = {
zoom: 8,
center: myLatlng,
mapTypeId: google.maps.MapTypeId.ROADMAP
}

map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

for (var i = 0; i < locationList.length; i++) {
var args = locationList[i].split(

",");
var location = new google.maps.LatLng(args[0], args[1])
var marker = new google.maps.Marker({
position: location,
map: map
});
var j = i + 1;
marker.setTitle(message[i].replace(/(<([^>]+)>)/ig,""));
attachSecretMessage(marker, i);
}
}

function attachSecretMessage(marker, number) {
var infowindow = new google.maps.InfoWindow(
{ content: message[number],
size: new google.maps.Size(50, 50)
});
google.maps.event.addListener(marker, 'click', function() {
infowindow.open(map, marker);
});
}
</script>

</head>
<body style="margin: 0px; padding: 0px;" onload="initialize()">
<form runat="server">
<div style="padding-top: 10%;padding-left:20%">
<div id="map_canvas" style="width: 50%; height: 50%">
</div>
</div>
</form>
</body>
</html>
--%>

<html>
<head>
<title></title>
<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=false">
</script>

<script type="text/jscript">
    var map;
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    function initialize()
     {
        var mapOptions = {
            center: latlng,
            zoom: 9,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var el = document.getElementById("map_canvas");
        map = new google.maps.Map(el, mapOptions);

        var marker = new google.maps.Marker({
            map: map,
            position: latlng
        });

        var sunCircle = {
            strokeColor: "#c3fc49",
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: "#c3fc49",
            fillOpacity: 0.35,
            map: map,
            center: latlng,
            radius: 15000 // in meters
        };
        cityCircle = new google.maps.Circle(sunCircle);
        cityCircle.bindTo('center', marker, 'position');
    }
    initialize();    

</script>

</head>
<body onload="initialize()">
<br />
<div id="map_canvas" style="width: 400px; height: 400px;"></div>
</body>
</html>