class BroadcastController < ApplicationController

  #Write channel bindings here
  def broadcast
    Pusher.trigger('wait_room', params[:event], message)
    print(message)
    render nothing: true
  end

  def message
    {
        from: current_user ? current_user.id : 'Anonymous',
        message: params[:message]
    }
  end
end
