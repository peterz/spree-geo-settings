var Geo = {
  init: function () {
    Geo.load_map();
  },
  
  // lat, lng, address, distance are global vars
  load_map: function () {
    var marker_text = "Store Location";
    
    var latlng = new google.maps.LatLng(lat, lng);
    var myOptions = {
      zoom: 14,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    
    var contentString = '<h2>' + marker_text +  '</h2>' +
    '<div>' + address + '</div>';
    
    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });
    
    var marker = new google.maps.Marker({
        position: latlng, 
        map: map, 
        title: marker_text
    });
    
    google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(map,marker);
    });
    
    var circle = new google.maps.Circle({
      map: map,
      radius: parseFloat(distance) * 1000
    });
    
    circle.bindTo('center', marker, 'position');
  }
}

$(document).ready(function() {
  Geo.init();
});
