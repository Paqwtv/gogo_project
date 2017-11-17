# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

namespace 'Events.MapBuilder', (exports) ->

  make_map = () ->
    cur_pos = { lat: 48.464228, lng: 35.045755 }
    map = new google.maps.Map(document.getElementById('map'),
      zoom: 14,
      center: cur_pos)
    
  make_bounds = (map, points) ->
    bounds = new google.maps.LatLngBounds()
    points.map (point) ->
      bounds.extend(point.position)
    map.panToBounds(bounds)
    map.fitBounds(bounds)
  
  set_value_to_input = (latitude, longitude) ->
    $("#event_latitude").val(latitude)
    $("#event_longitude").val(longitude)
    #geocode_location(latitude, longitude)


  exports.make_marker = (map, point) ->
    marker = new google.maps.Marker(
      position: point.position,
      icon: point.icon,
      title: point.title,
      map: map,
      draggable: true,
      animation: google.maps.Animation.DROP )
    marker
  
  exports.add_markers = (map, points) ->
    points.map (point) ->
      Events.MapBuilder.make_marker(map, point)

  exports.init_map_with = (points) ->
    console.log(points)
    map = make_map()
    Events.MapBuilder.add_markers(map, points)
    make_bounds(map, points)

  exports.init_map_with_one = (point) ->
    console.log(point)
    lat_lng = point.position
    map = make_map()
    marker = Events.MapBuilder.make_marker(map, point)
    map.setCenter(new google.maps.LatLng(lat_lng['lat'],lat_lng['lng']))
    map.setZoom(15)
    latitude = point.position['lat']
    longitude = point.position['lng']
    set_value_to_input(point.position['lat'], point.position['lng'])
    Events.MapBuilder.add_listener(marker, point)

  exports.add_listener = (marker, point) ->
    google.maps.event.addListener(marker, "dragend", (event) ->
      latitude = event.latLng.lat()
      longitude = event.latLng.lng()
      set_value_to_input(latitude, longitude)
    )

  geocode_location = (lat, lng) ->
    geocoder = new google.maps.Geocoder()
    latlng = new (google.maps.LatLng)(lat, lng)
    geocoder.geocode { 'latLng': latlng, 'language': 'ru' }, (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        if results[1]
          console.log results[1].formatted_address
          $('#event_address').val(results[1].formatted_address)
        else
          $('#event_address').val('No results found')
      else
        alert 'Geocoder failed due to: ' + status
