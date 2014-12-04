class BroadcastController < ApplicationController
  def broadcast
    Pusher.trigger('wait_room', 'user:said', message)
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
