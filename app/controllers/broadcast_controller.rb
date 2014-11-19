class BroadcastController < ApplicationController
  def broadcast
    Pusher.trigger('chat', 'user:said', message)
    print(message)
    render nothing: true
  end

  def message
    {
        from: current_user ? current_user.email : 'Anonymous',
        message: params[:message]
    }
  end
end
