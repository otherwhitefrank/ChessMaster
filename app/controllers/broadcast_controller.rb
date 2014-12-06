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
        if (curr_game.valid_move?(old_x, old_y, attempted_x, attempted_y))
          #Move is okay, do the move
          Pusher[channel_id].trigger('server:move_ok', {user_id: user_id,
                                                        opponent_id: opponent_id,
                                                        old_x: old_x,
                                                        old_y: old_y,
                                                        attempted_x: attempted_x,
                                                        attempted_y: attempted_y})
          #Tell the other player to issue the same command switching user_id's
          Pusher[channel_id].trigger('server:move_ok', {user_id: opponent_id,
                                                        opponent_id: user_id,
                                                        old_x: old_x,
                                                        old_y: old_y,
                                                        attempted_x: attempted_x,
                                                        attempted_y: attempted_y})
        else
          #Tell client that is not okay, don't change anything, no need to tell other player
          Pusher[channel_id].trigger('server:move_not_ok', {user_id: user_id,
                                                            opponent_id: opponent_id,
                                                            old_x: old_x,
                                                            old_y: old_y,
                                                            attempted_x: attempted_x,
                                                            attempted_y: attempted_y})
          #Tell the other player to issue the same command switching user_id's
          Pusher[channel_id].trigger('server:move_not_ok', {user_id: opponent_id,
                                                        opponent_id: user_id,
                                                        old_x: old_x,
                                                        old_y: old_y,
                                                        attempted_x: attempted_x,
                                                        attempted_y: attempted_y})
        end
    end
  end
end
