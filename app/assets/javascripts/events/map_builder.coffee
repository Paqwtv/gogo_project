# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

namespace 'Events.MapBuilder', (exports) ->
  make_map = () ->
    dnepr = { lat: 48.464228, lng: 35.045755 }
    map = new google.maps.Map(document.getElementById('map'), zoom: 14, center: dnepr)
  
  exports.add_markers = (points) ->
    map = make_map()
    

  exports.init_map = () -> 
    console.log("Mapinit")
    map = make_map()
    marker = new google.maps.Marker( position: dnepr, map: map )
