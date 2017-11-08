# map markers builder
class MarkerFilter
  ICONS = {
    plase: 'https://png.icons8.com/marker/office/40',
    cur: 'https://png.icons8.com/street-view/office/40'
  }.freeze
  def initialize(points)
    @points = points
  end

  def markers_data
    @points.map { |point| make_from point }
  end

  def make_from(point)
    {
      position: point[:position],
      icon: ICONS[point[:icon]],
      title: point[:title]
    }
  end
end
