# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

namespace 'Events.MapBuilder', (exports) ->
  make_map = (points) ->
    points ||= { lat: 48.464228, lng: 35.045755 }
    map = new google.maps.Map(document.getElementById('map'), zoom: 14, center: points)
  
  exports.add_markers = (points) ->
    console.log(points)
    marker = new google.maps.Marker( position: points, map: map )


  exports.init_map = (points) -> 
    console.log("Mapinit")
    map = make_map(points)
    icon = {url: 'http://files.softicons.com/download/web-icons/vista-map-markers-icons-by-icons-land/png/256x256/MapMarker_Marker_Outside_Azure.png',
    size: new google.maps.Size(20, 20)}
    marker = new google.maps.Marker( position: points, map: map, icon: icon, draggable: true, animation: google.maps.Animation.DROP )
    
