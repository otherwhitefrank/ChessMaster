# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  root.pusher = new Pusher('bca91b4571f77551a885')
  root.wait_room = pusher.subscribe 'wait_room'

  player_1_id = undefined
  player_2_id = undefined
  unique_channel_id = undefined

  root.game_room = {}

  if ($('#player_1_id').length != 0)
    player_1_id = $('#player_1_id').html()

  if ($('#player_2_id').length != 0)
    player_2_id = $('#player_2_id').html()

  if ($('#unique_channel_id').length != 0)
    unique_channel_id = $('#unique_channel_id').html()

  if (player_2_id != undefined)
    #Client is at start_game/join_game, join match channel
    bind_events(unique_channel_id)

  wait_room.bind('server:join_channel', (data) ->
    if (data.active_player_id.toString() == player_1_id)
      player_1_id = data.active_player_id
      player_2_id = data.opponent_player_id
      unique_channel_id = data.channel_id
      #Command Tell other players browser to join game
      join_game(player_1_id, player_2_id, unique_channel_id)
  )

  wait_room.bind('server:leave_channel', (data) ->
    unbind_events(data.channel_id)
    #Goto root
    window.location.href = "/"

  )

  $('#message').keypress (e) ->
    if e.keyCode == 13
      # Cancel the default action on keypress event
      e.preventDefault()
      $.ajax '/broadcast/broadcast', {
        type: 'POST'

        data: {
                message: $("#message").val()
                event: 'user:said'
                channel: unique_channel_id
                id: player_1_id
              }

        error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus

        success: (data, textStatus, jqXHR) ->
          console.log data
      }


root = exports ? this

root.send_message = (message) ->
  $.ajax '/broadcast/broadcast', {
    type: 'POST'

    data: message

    error: (jqXHR, textStatus, errorThrown) ->
      console.log "AJAX Error: #{textStatus}<br>"

    success: (data, textStatus, jqXHR) ->
      console.log "Successful AJAX call: #{data}<br>"
  }

bind_events = (channel_id) ->
  window.game_room = window.pusher.subscribe channel_id

  window.game_room.bind('server:said', (data) ->
    $('#message-area').append "#{data.message}<br>"
  )


unbind_events = (channel_id) ->
  window.game_room = window.pusher.unsubscribe data.channel_id


join_game = (player_1_id, player_2_id, unique_channel_id) ->
  $('#active_user_id').val(player_1_id.toString())
  $('#opponent_user_id').val(player_2_id.toString())
  $('#unique_channel_id').val(unique_channel_id)
  $('#join_game_id').submit()
