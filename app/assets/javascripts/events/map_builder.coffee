# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

namespace 'Events.MapBuilder', (exports) ->
  make_map = (points) ->
    cur_pos = { lat: 48.464228, lng: 35.045755 }
    map = new google.maps.Map(document.getElementById('map'),
      zoom: 14,
      center: cur_pos)

    Events.MapBuilder.add_markers(map, points)
    
  exports.make_marker = (map, point) ->
    marker = new google.maps.Marker(
      position: point.position,
      icon: point.icon,
      title: point.title,
      map: map,
      draggable: true,
      animation: google.maps.Animation.DROP )
  
  exports.add_markers = (map, points) ->
    points.map (point) ->
      Events.MapBuilder.make_marker(map, point)


  exports.init_map = (points) -> 
    console.log(points)
    map = make_map(points)
 
    
    
