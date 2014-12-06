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
    @unique_channel_id =  Digest::SHA1.hexdigest (channel_name)

    puts @unique_channel_id

    puts @player_1
    puts @player_2

    @current_game = Game.new
    @current_game.initiate_game(@player_1, @player_2, @unique_channel_id, 500)
    @current_game.save!
    @current_game.init_pieces
    @current_game.save!

    Pusher['wait_room'].trigger('server:join_channel', {
        message: "Join Room #{@player_2.id} #{@unique_channel_id}",
        channel_id: @unique_channel_id,
        active_player_id: @player_2.id,
        opponent_player_id: @player_1.id
    })
  end

  def join_game
    @player_1_id = params[:active_user_id]
    @player_2_id = params[:opponent_user_id]
    @unique_channel_id = params[:unique_channel_id]
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

end
