# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#bind_events -> game_room
#  game_room.bind('user:move', (data) ->
#    if (data.user == current_user)

$(document).ready ->
  pusher = new Pusher('bca91b4571f77551a885')
  wait_room = pusher.subscribe 'wait_room'

  game_room = {}

  wait_room.bind('user:said', (data) ->
    $('#message-area').append "Successful AJAX call: #{data.from} sent: #{data.message}<br>"
  )

  wait_room.bind('server:join_channel', (data) ->
    game_room = pusher.subscribe data.game_room_id
    #bind_events(game_room)
  )

  wait_room.bind('server:leave_channel', (data) ->
    game_room = pusher.unsubscribe data.game_room_id
    #unbind_events(game_room)
  )

  $('#message').keypress (e) ->
    if e.keyCode == 13
      # Cancel the default action on keypress event
      e.preventDefault()
      $.ajax '/broadcast/broadcast', {
        type: 'POST'
        data: { message: $("#message").val() }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log "AJAX Error: #{textStatus}<br>"

        success: (data, textStatus, jqXHR) ->
          console.log "Successful AJAX call: #{data}<br>"
      }

