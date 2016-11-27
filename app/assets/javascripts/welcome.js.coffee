ready = ->
  questionForm = $('#new_user')

  questionForm.on 'ajax:success', (e, data, status, xhr) ->
    debugger
    $(questionForm)[0].reset();
    window.location.href = "/"

  questionForm.on 'ajax:error', (e, data, status, xhr) ->
    $.map(data.responseJSON['errors'], (v, k) ->
      message =  k + ": " + v
      console.log message
      alertFunc("#{message}", 'red')
    ).join ""

$(document).on("turbolinks:load", ready)
