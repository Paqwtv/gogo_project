# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

namespace 'Event.MapBuilder', (exports) ->
  exports.init_map = () -> 
    uluru = {
      lat: 48.464228
      lng: 35.045755
      }
    map = new (google.maps.Map)(document.getElementById('map'),
      zoom: 14
      center: uluru)
    marker = new (google.maps.Marker)(
      position: uluru
      map: map)
