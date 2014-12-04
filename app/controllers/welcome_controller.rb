class WelcomeController < ApplicationController
  attr_accessor :player_1, :player_2, :current_game

  def start_game
    #Retrieve player_1 and player_2 id's from post params

    player_1_id = params[:active_user]
    player_2_id = params[:selected_user]

    @player_1 = User.find(player_1_id)
    @player_2 = User.find(player_2_id)

    #Build a custom channel name out of emails
    channel_name = @player_1.email + @player_2.email
    unique_channel_id =  Digest::SHA1.hexdigest (channel_name)

    puts unique_channel_id

    puts @player_1.email
    puts @player_2.email

    @current_game = Game.create
    @current_game.initiate_game(@player_1.player, @player_2.player, unique_channel_id, 500)

    bind_channel_events(unique_channel_id)

    Pusher['wait_room'].trigger('user:join_channel', {
        message: "Join Room #{@player_2.id} #{unique_channel_id}"
    })
  end

  def join_game


  end

  def home
    #base welcome page
    @users        = User.all
    @online_users = []
    if (current_user != nil)
      @current_user_email = current_user['email']
      @current_user_id = current_user['id']

      @users.each do |user|
        @online_now = user['updated_at'] > 10.minutes.ago
        @user_name  = user['email']
        if (@user_name != @current_user_email)
          @online_users.push(user)
        end
      end
    end
  end

  def bind_channel_events(unique_channel_id)
    Pusher[unique_channel_id].trigger('user:move', {
        message: 'hello world'
    })

    Pusher[unique_channel_id].trigger('user:ok', {
        message: 'hello world'
    })
  end
end
