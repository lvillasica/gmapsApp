// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

  var geocoder;
  var map;
  var infowindow = new google.maps.InfoWindow();

  function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    
  }

  function admincodeAddress() {
    var address = document.getElementById("place_place_name").value;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            draggable: true
        });
        google.maps.event.addListener(marker, "dragend", function() {
		    var point = marker.getPosition();
		    map.panTo(point);
		    document.getElementById("place_lat").value = point.lat();
		    document.getElementById("place_long").value = point.lng();
        });

      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }

  function codeLatLng(lat, lng) {
    var latlng = new google.maps.LatLng(lat, lng);
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(latlng);
        if (results[1]) {
          map.setZoom(15);
          var marker = new google.maps.Marker({
              position: latlng,
              map: map
          });
          infowindow.setContent(results[1].formatted_address);
          infowindow.open(map, marker);
        }
      } else {
        alert("Geocoder failed due to: " + status);
      }
    });
  }

