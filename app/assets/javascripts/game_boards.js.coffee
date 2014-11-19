# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready ->
  pusher = new Pusher('bca91b4571f77551a885')
  channel = pusher.subscribe 'chat'


  channel.bind('user:said', (data) ->
    $('#message-area').append "Successful AJAX call: #{data.from} sent: #{data.message}<br> ")


  $('#message').keypress (e) ->
      if e.keyCode == 13
        # Cancel the default action on keypress event
        e.preventDefault();
        $.ajax '/broadcast/broadcast',

          type: 'POST'
          data: { message: $("#message").val() }

          error: (jqXHR, textStatus, errorThrown) -> console.log "AJAX Error: #{textStatus}<br>"

          success: (data, textStatus, jqXHR) -> console.log "Successful AJAX call: #{data}<br>"