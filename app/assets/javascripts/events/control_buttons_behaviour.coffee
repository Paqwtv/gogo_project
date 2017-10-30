namespace 'Events.ControlButtonsBehaviou', (exports) ->
  
  tab_click_behaviour = (e) ->
    e.preventDefault()
    id = $(this).attr('id')
    content_id = "#" + id + '_content'

    class_name = "." + $(this).attr('block_name')
    content_class_name = class_name + '_content'

    # clear all states
    $(class_name).removeClass("active")
    $(content_class_name).hide()

    #set new states
    $(this).addClass('active')
    $(content_id).show('slow')
    

  exports.init = (class_name)->
    $(class_name).click tab_click_behaviour
