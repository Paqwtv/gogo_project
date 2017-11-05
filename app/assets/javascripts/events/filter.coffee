namespace 'Event.SearchFilter', (exports) ->
  
  exports.filter = (url, data, type, callback_method) ->
    $.ajax({
      data: data,
      type: type,
      url: url,
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: callback_method
    })

  events_search_callback = (data) -> 
    # do what you should with all that data
    $('#list_tab_content').html(data)

  get_all_checkboxes = (class_name) ->
    $("input.#{class_name}:checkbox:checked").map( () ->
      $(this).val() ).get()

  get_all_filter_data = (form_id) ->
    data = {}
    $(form_id).find( '[name]' ).each( ( i , v ) ->
      input = $( this )
      name = input.attr( 'name' )
      if input.attr('type') == 'checkbox'
        value = get_all_checkboxes(input.attr('class'))
      else 
        value = input.val()
      if input.attr('type') != 'hidden' && input.attr('type') != 'submit'
        data[name] = value
      )
    return data

  exports.events_search = (id) ->
    data = get_all_filter_data(id)
    data['layout_false'] = true
    url = 'events'
    type = 'GET'
    Event.SearchFilter.filter url, data, type, events_search_callback