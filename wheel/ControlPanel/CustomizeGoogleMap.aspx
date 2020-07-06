<%@ page language="C#" autoeventwireup="true" inherits="ControlPanel_CustomizeGoogleMap, App_Web_x5lf5vqe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">
</script>

    <script type="text/javascript">
        var directionDisplay;
        var directionsService = new google.maps.DirectionsService();

        function initializeMaps() {
            var latlng = new google.maps.LatLng(51.764696, 5.526042);
            directionsDisplay = new google.maps.DirectionsRenderer();
            var myOptions = {
                zoom: 16,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                mapTypeControl: false
            };



            var map = new google.maps.Map(document.getElementById("google_maps"), myOptions);

        var image = new google.maps.MarkerImage('images/HospitalRed-32.png',
        new google.maps.Size(65, 124),
        new google.maps.Point(0, 0),
        new google.maps.Point(56, 122)
    );

            var shadow = new google.maps.MarkerImage('marker_shadow.png',
        new google.maps.Size(96, 59),
        new google.maps.Point(0, 0),
        new google.maps.Point(32, 59)
    );

            var customMarker = new google.maps.Marker({
                position: latlng,
                map: map,
                shadow: shadow,
                title: "Carlos Gallupa HQ",
                icon: image
            });
            
//            var customMarker = [['place1', 55.8, -4.020508],['place2', 53.3, -7.61],['place3', 57.9, -8.12]];

//            for (var i = 0; i < customMarker.length; i++) {
//           var marker =  new google.maps.Marker({
//                    position: new google.maps.LatLng(lat, lon),
//                    map: map
//                });
        }
    </script>

    <script type="text/javascript">
        function initialize()
         {
            var latlng = new google.maps.LatLng(39.984577, -83.018692);
            var options = {
                zoom: 12,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var image = 'images/more-bg.jpg';

            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                icon: image,
                title: "43201"
            });

               var circle = new google.maps.Circle({
                map: map,
                radius: 300,   
                fillColor: '#AA0000'
            });
            circle.bindTo('center', marker, 'position');

            var base = new GShape();
            base.type = circle;
            base.anchor = new GPoint(-83.018692, 39.984577);  
            base.radius = 0.0273548;  // degrees of latitude

            var map = new google.maps.Map(document.getElementById("map"), options);

            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                title: "43201"
            });
        }  
    </script>
</head>
<body onload=" initializeMaps()" >
    <form id="form1" runat="server">
    <div id="google_maps" style="width: 500px; height: 400px">
   
    </div>
    <div id="map" style="width: 500px; height: 400px"></div>
    </form>
</body>
</html>
