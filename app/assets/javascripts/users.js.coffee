# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $("input[data-score-item]").focusout ->
    me = $(this)
    value = $(this).val()
    $(this).addClass("data-sending")
    $(this).closest('div.form-group').removeClass('has-success')
    $.ajax
      type: 'patch',
      url: "/values/#{$(this).attr('data-value-id')}",
      data:
        utf8: "✓"
        authenticity_token: $('meta[name="csrf-token"]').attr('content')
        value:
          value: value
      success: (data) ->
        console.log(data['value'])
        me.removeClass("data-sending")
        me.closest('div.form-group').addClass('has-success')


$(document).ready(ready)
$(document).on('page:load', ready)