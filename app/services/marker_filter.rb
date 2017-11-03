# map markers builder
class MarkerFilter
  def initialize(points, geotag = nil)
    @points = points
    @geotag = geotag
  end

  def make_marker
    @result = []
    create_geopos unless @geotag.nil?
    create_event
  end

  def create_event
    @points.each do |elem|
      @result << {
        position: { lat: elem.latitude, lng: elem.longitude },
        icon: 'http://maps.google.com/mapfiles/kml/paddle/grn-circle.png',
        title: elem.title
      }
    end
    @result
  end

  def create_geopos
    @result << {
      position: { lat: @geotag[0].to_f, lng: @geotag[1].to_f },
      title: 'Current position',
      icon: 'http://maps.google.com/mapfiles/kml/paddle/blu-circle.png'
    }
  end
end
