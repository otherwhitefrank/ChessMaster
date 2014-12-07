class BroadcastController < ApplicationController

  #Write channel bindings here
  def broadcast
    #Make a decision on what channel and event is sent
    channel_id = params[:channel]
    event = params[:event]
    message = params[:message]
    user_id = params[:active_id]
    opponent_id = params[:opponent_id]

    route_broadcast(user_id, opponent_id, channel_id, event, message)

    puts "Channel: #{channel_id} Event: #{event} Message: #{message}"
    render nothing: true
  end

  def format_chat(user_id, message)
    username = User.find(user_id).username
    return "#{username} said: #{message}"
  end

  def get_board_from_channel_id(channel_id)
    Game.find_by(unique_channel_id: channel_id)
  end


  def send_message(channel_id, event, data)
    Pusher[channel_id].trigger(event, data)
  end


  def route_broadcast(user_id, opponent_id, channel_id, event, message)
    case event
      when 'user:said'
        #This is a chat/message event, so just render it
        Pusher[channel_id].trigger('server:said', {message: format_chat(user_id, message)})
      when 'user:ask_to_move'
        #Check moves validity
        old_x = message['old_x']
        old_y = message['old_y']
        attempted_x = message['attempted_x']
        attempted_y = message['attempted_y']

        curr_game = get_board_from_channel_id(channel_id)

        #Parse message for grid coordinates
        if (curr_game.valid_move?(user_id, old_x, old_y, attempted_x, attempted_y))
          #is someone on the attempted square
          taken_piece = curr_game.find_piece(attempted_x, attempted_y)

          if (taken_piece != nil)
            #There was a piece at the old square, tell clients to delete it
            send_data = {user_id: user_id,
                         opponent_id: opponent_id,
                         old_x: old_x,
                         old_y: old_y,
                         attempted_x: attempted_x,
                         attempted_y: attempted_y}
            send_message(channel_id, 'server:delete_piece', send_data)

            send_data = {user_id: opponent_id,
                         opponent_id: user_id,
                         old_x: old_x,
                         old_y: old_y,
                         attempted_x: attempted_x,
                         attempted_y: attempted_y}
            send_message(channel_id, 'server:delete_piece', send_data)
          end

          curr_game.move(old_x, old_y, attempted_x, attempted_y)

          #Move is okay, do the move
          send_data = {user_id: user_id,
                       opponent_id: opponent_id,
                       old_x: old_x,
                       old_y: old_y,
                       attempted_x: attempted_x,
                       attempted_y: attempted_y}
          send_message(channel_id, 'server:move_ok', send_data)

          #Tell the other player to issue the same command switching user_id's
          send_data = {user_id: opponent_id,
                       opponent_id: user_id,
                       old_x: old_x,
                       old_y: old_y,
                       attempted_x: attempted_x,
                       attempted_y: attempted_y}
          send_message(channel_id, 'server:move_ok', send_data)

          curr_game.switch_player_turn()

        else
          #Tell client that is not okay, don't change anything, no need to tell other player
          send_data = {user_id: user_id,
                       opponent_id: opponent_id,
                       old_x: old_x,
                       old_y: old_y,
                       attempted_x: attempted_x,
                       attempted_y: attempted_y}
          send_message(channel_id, 'server:move_not_ok', send_data)


          #Tell the other player to issue the same command switching user_id's
          send_data = {user_id: opponent_id,
                       opponent_id: user_id,
                       old_x: old_x,
                       old_y: old_y,
                       attempted_x: attempted_x,
                       attempted_y: attempted_y}
          send_message(channel_id, 'server:move_not_ok', send_data)

        end
    end
  end
end
