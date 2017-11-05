# map markers builder
class MarkerFilter
  ICONS = {
    green: 'http://maps.google.com/mapfiles/kml/paddle/grn-circle.png',
    blue: 'http://maps.google.com/mapfiles/kml/paddle/blu-circle.png'
  }
  def initialize(points)
    @points = points
  end

  def markers_data
    @points.map {|point|
      make_from point
    }

  end

  def make_from point
    {
      position: point[:position],
      icon: ICONS[point[:icon]],
      title: point[:title]
    }
  end
end
