<%@ page language="C#" autoeventwireup="true" inherits="ControlPanel_MapDirection, App_Web_x5lf5vqe" %>

<%--<!DOCTYPE html>
<html> 
<head> 
   <meta http-equiv="content-type" content="text/html; charset=UTF-8"/> 
   <title>Google Maps GDirections</title> 
   <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false" 
           type="text/javascript"></script> 
</head> 

<body onload="initialize()">
   <div id="map" style="width: 400px; height: 300px"></div> 

   <script type="text/javascript">
       function initialize() {
           var map = new GMap2(document.getElementById("map"));
           var directions = new GDirections(map);
           var isCreateHeadPoint = true;
           var headMarker, tailMarker;

           map.setCenter(new GLatLng(51.50, -0.12), 12);

           GEvent.addListener(map, "click", function (overlay, point) {
               if (isCreateHeadPoint) {
                   // add the head marker
                   headMarker = new GMarker(point);
                   map.addOverlay(headMarker);
                   isCreateHeadPoint = false;
               }
               else {
                   // add the tail marker
                   tailMarker = new GMarker(point);
                   map.addOverlay(tailMarker);
                   isCreateHeadPoint = true;
                   // create a path from head to tail
                   directions.load("from:" + headMarker.getPoint().lat() + ", " +
                         headMarker.getPoint().lng() +
                         " to:" + tailMarker.getPoint().lat() + "," +
                         tailMarker.getPoint().lng(),
                         { getPolyline: true, getSteps: true });
               }
           });
       }
   </script> 
</body> 
</html>
--%>
<%--<!DOCTYPE html>
<html>
    <head><meta name="viewport" content="initial-scale=1.0, user-scalable=no"/><meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <title>Google Maps JavaScript API v3 Example: Directions Waypoints</title>
        <link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false">
        </script>
        <script type="text/javascript">
            var directionDisplay;
            var directionsService = new google.maps.DirectionsService();
            var map;

            function initialize() {
                directionsDisplay = new google.maps.DirectionsRenderer();
                var chicago = new google.maps.LatLng(-40.321, 175.54);
                var myOptions = {
                    zoom: 6,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    center: chicago
                }
                map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
                directionsDisplay.setMap(map);
                calcRoute();
            }

            function calcRoute() {

                var waypts = [];


                stop = new google.maps.LatLng(-39.419, 175.57)
                waypts.push({
                    location: stop,
                    stopover: true
                });


                start = new google.maps.LatLng(-40.321, 175.54);
                end = new google.maps.LatLng(-38.942, 175.76);
                var request = {
                    origin: start,
                    destination: end,
                    waypoints: waypts,
                    optimizeWaypoints: true,
                    travelMode: google.maps.DirectionsTravelMode.WALKING
                };
                directionsService.route(request, function (response, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        directionsDisplay.setDirections(response);
                        var route = response.routes[0];

                    }
                });
            }
        </script>
    </head>
    <body onload="initialize()">
        <div id="map_canvas" style="width:70%;height:80%;">
        </div>
        <br />
        <div>

        </div>
    </body>
</html>

<!doctype html>--%>
<%--<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript">

        var myRouter = {
            map_: null,
            directionsHelper_: null,

            stores: [
                    { name: "store1", location: new google.maps.LatLng(50.82788, 3.76499) },
                    { name: "store2", location: new google.maps.LatLng(51.02788, 3.9) }
                ],

            calcRoute: function () {

                var waypts = [];

                for (var i in this.stores) {
                    waypts.push({
                        location: this.stores[i].location,
                        stopover: true
                    });
                }
                var request = {
                    origin: new google.maps.LatLng(50.82788, 3.26499),
                    destination: "Antwerp",
                    waypoints: waypts,
                    optimizeWaypoints: true,
                    travelMode: google.maps.DirectionsTravelMode.DRIVING
                };

                var _SELF = this;
                this.directionsHelper_.route(request, function (response, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        _SELF.directionsDisplay_.setDirections(response);
                        return;
                    }
                    console.log('Directions Status: ' + status);
                });
            },

            init: function (mapid) {

                this.directionsHelper_ = new google.maps.DirectionsService();
                this.directionsDisplay_ = new google.maps.DirectionsRenderer();

                var center = new google.maps.LatLng(50.82788, 3.26499);
                var myOptions = {
                    zoom: 7,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    center: center
                }
                this.map_ = new google.maps.Map(document.getElementById(mapid), myOptions);
                this.directionsDisplay_.setMap(this.map_);

                this.calcRoute();
            }
        };

        $(document).ready(function () {
            myRouter.init('map');
        });

    </script>
    <style type="text/css">
        #map {
            height: 500px;
            width: 600px;
            border: 1px solid #000;
        }
    </style>
</head>
<body>
    <div id="Div1"></div>
</body>
</html>--%>
<%--


<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <title>Displaying text directions with <code>setPanel()</code></title>
    <link href="/maps/documentation/javascript/examples/default.css" rel="stylesheet">
    <style>
      #directions-panel {
        height: 100%;
        float: right;
        width: 390px;
        overflow: auto;
      }

      #map-canvas {
        margin-right: 400px;
      }

      #control {
        background: #fff;
        padding: 5px;
        font-size: 14px;
        font-family: Arial;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
        display: none;
      }

      @media print {
        #map-canvas {
          height: 500px;
          margin: 0;
        }

        #directions-panel {
          float: none;
          width: auto;
        }
      }
    </style>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    
    <script type="text/javascript">

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

            var control = document.getElementById('control');
            control.style.display = 'block';
            map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
        }

        function calcRoute() {
            var start = document.getElementById('start').value;
            var end = document.getElementById('end').value;
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.TravelMode.DRIVING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });
        }

   google.maps.event.addDomListener(window, 'onload', initialize);

    </script>
  </head>
  <body>
    <div id="control">
      <strong>Start:</strong>
      <select id="start" onchange="calcRoute();">
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
        <option value="los angeles, ca">Los Angeles</option>
      </select>
    </div>
    <div id="directions-panel"></div>
    <div id="map-canvas"></div>
  </body>
</html>
--%>

<%--<!DOCTYPE html>
<html> 
<head> 
   <meta http-equiv="content-type" content="text/html; charset=UTF-8"/> 
   <title>Google Maps JavaScript API v3 Example: Directions Complex</title> 
   <script type="text/javascript" 
           src="http://maps.google.com/maps/api/js?sensor=false"></script>
</head> 
<body style="font-family: Arial; font-size: 13px; color: red;"> 
   <div id="map" style="width: 400px; height: 300px;"></div> 
   <div id="duration">Duration: </div> 
   <div id="distance">Distance: </div> 

   <script type="text/javascript">

       var directionsService = new google.maps.DirectionsService();
       var directionsDisplay = new google.maps.DirectionsRenderer();

       var myOptions = {
           zoom: 7,
           mapTypeId: google.maps.MapTypeId.ROADMAP
       }

       var map = new google.maps.Map(document.getElementById("map"), myOptions);
       directionsDisplay.setMap(map);

       var request = {
           origin: 'Chicago',
           destination: 'New York',
           travelMode: google.maps.DirectionsTravelMode.DRIVING
       };

       directionsService.route(request, function (response, status) {
           if (status == google.maps.DirectionsStatus.OK) {

               // Display the distance:
               document.getElementById('distance').innerHTML +=
            response.routes[0].legs[0].distance.value + " meters";

               // Display the duration:
               document.getElementById('duration').innerHTML +=
            response.routes[0].legs[0].duration.value + " seconds";

               directionsDisplay.setDirections(response);
           }
       });
   </script> 
</body> 
</html>
--%>
<%--
<!DOCTYPE html>
<html> 
<head> 
   <meta http-equiv="content-type" content="text/html; charset=UTF-8"/> 
   <title>Google Maps JavaScript API v3 Example: Directions Complex</title> 
   <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
</head> 

<body style="font-family: Arial; font-size: 13px; color: red;"> 
   
   <div id="map" style="width: 400px; height: 300px; float:left;"></div>
   <div id="directions" style="width: 200px; height: 300px; float:right;"></div>

   <script type="text/javascript">

       var map = new google.maps.Map(document.getElementById("map"), {
           zoom: 7,
           mapTypeId: google.maps.MapTypeId.ROADMAP,
           center: new google.maps.LatLng(-33.917, 18.417)
       });

       var directionsRenderer = new google.maps.DirectionsRenderer();
       directionsRenderer.setMap(map);
       directionsRenderer.setPanel(document.getElementById('directions'));
       var directionsService = new google.maps.DirectionsService();
       var request = {
           origin: "Cape Town, South Africa",
           destination: "Tableview, South Africa",

           travelMode: google.maps.DirectionsTravelMode.DRIVING,
           unitSystem: google.maps.DirectionsUnitSystem.METRIC,
           provideTripAlternatives: true
       };
       directionsService.route(request, function (response, status) {
           if (status == google.maps.DirectionsStatus.OK) {
               directionsRenderer.setDirections(response);
           } else {
               alert('Error: ' + status);
           }
       });  
   </script> 
</body> 
</html>--%>




<%--<!DOCTYPE html>
<html>
<head> 
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/> 
    <title>Calculate Distance</title>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&v=3&libraries=geometry"></script>
    <style type="text/css">
        #map{width:800px;height:500px}
    </style>

</head>

<body style="font-family: Arial; font-size: 13px; color: red;">
<form id="Form1" runat="server">

    <div id="map"></div>

    <input runat="server" type="hidden" id="DistanceValue" name="DistanceValue" />

    <script type="text/javascript">

        var latlng = new google.maps.LatLng(54.40708, 18.667485);
        var latlng2 = new google.maps.LatLng(54.40708, 18.667485);

        var myOptions =
            {
                zoom: 4,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

        var map = new google.maps.Map(document.getElementById('map'), myOptions);

        var marker = new google.maps.Marker({
            position: latlng,
            title: "Westerplatte - first battle of WW2 in Europe",
            clickable: true,
            map: map
        });

        var marker2 = new google.maps.Marker({
            position: latlng2,
            title: "Westerplatte - first battle of WW2 in Europe",
            clickable: true,
            map: map
        });

        google.maps.event.addListener(map, "click", function (event) {
            latlng2 = new google.maps.LatLng(event.latLng.lat(), event.latLng.lng());
            marker2.setMap(null);
            marker2 = new google.maps.Marker({
                position: latlng2,
                title: "selected by user",
                clickable: true,
                map: map
            });

            var hidden = document.getElementById("DistanceValue");
            hidden.value = google.maps.geometry.spherical.computeDistanceBetween(latlng, latlng2) / 1000;
        });

    </script>


    <asp:Button  ID="Button1" runat="server" Text="Send distance" onclick="Button1_Click" />

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

</form>
</body>  

</html> --%>