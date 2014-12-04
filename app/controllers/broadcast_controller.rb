class BroadcastController < ApplicationController

  #Write channel bindings here
  def broadcast
    #Make a decision on what channel and event is sent
    channel_id = params[:channel]
    event = params[:event]
    message = params[:message]
    user_id = params[:id]

    route_broadcast(id, channel_id, event, message)

    puts "Channel: #{channel_id} Event: #{event} Message: #{message}"
    render nothing: true
  end

  def format_chat(user_id, message)
    username = User.find(user_id).username
    return "#{username} said: #{message}"
  end

  def get_board_from_channel_id(channel_id)
    return Game.get_game_from_channel_id(channel_id)
  end

  def route_broadcast(user_id, channel_id, event, message)
    case event
      when 'user:said'
        #This is a chat/message event, so just render it
        Pusher[channel_id].trigger('server:said', {message: format_chat(user_id, message)})
      when 'user:move'
        #Check moves validity
        curr_game = get_board_from_channel_id(channel_id)
        curr_game_board = curr_game.game_board

        #Parse message for grid coordinates

        if (curr_game_board.valid_move?(x1, y1, x2, y2))
          #Move is okay, do the move
        else
          #Tell client that is not okay, don't change anything
        end
    end
  end
end
