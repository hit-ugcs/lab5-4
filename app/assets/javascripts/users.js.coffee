# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $("input[data-score-item]").focusout ->
    me = $(this)
    value = $(this).val()
    $(this).closest('div').find('button').html("Syncing...")
    $(this).closest('div').find('span#status').html("<i class='fa fa-fw fa-refresh fa-spin'></i>")
    $(this).closest('div.form-group').removeClass('has-success').removeClass('has-error')
    $.ajax
      type: 'patch',
      url: "/values/#{$(this).attr('data-value-id')}",
      timeout: 3000,
      data:
        utf8: "✓"
        authenticity_token: $('meta[name="csrf-token"]').attr('content')
        value:
          value: value
      success: (data) ->
        me.closest('div').find('span#status').html("<i class='fa fa-fw fa-check'></i>")
        me.closest('div').find('button').html("Submit")
        me.closest('div.form-group').addClass('has-success')
      error: (data) ->
        me.closest('div').find('span#status').html("<i class='fa fa-fw fa-close'></i>")
        me.closest('div').find('button').html("Submit")
        me.closest('div.form-group').addClass('has-error')

  $("button.useless").click ->
    alert "Data alredy synced!"

$(document).ready(ready)
$(document).on('page:load', ready)