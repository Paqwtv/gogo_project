module EventsHelper
  def generate_control_panel block_name, elems, selected
    elements = elems.map { |elem|
      class_name = (elem[:id] == selected) ? block_name + ' active' : block_name
      tag.a(elem[:value], id: elem[:id], class: class_name, block_name: block_name)
    }.join('<span>&nbsp;</span>')

    tag.div(elements.html_safe, class: 'control_panel')
  end
end
