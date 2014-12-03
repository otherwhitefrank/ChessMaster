class WelcomeController < ApplicationController
  attr_accessor :player_1, :player_2

  def start_game
    #Start a game with the next active player
    @player_1 = current_user

    #Find players that are active and not playing
  end

  def home
    #base welcome page
    @users        = User.all
    @online_users = []
    if (current_user != nil)
      @current_user_email = current_user['email']

      @users.each do |user|
        @online_now = user['updated_at'] > 10.minutes.ago
        @user_name  = user['email']
        if (@user_name != @current_user_email)
          @online_users.push(user)
        end
      end
    end
  end


  def start_game_with_player
    #Start a game with a specific player
    @player_1 = current_user
    @player_2 = params[:second_player]
    #Start game
  end

  def continue_game
    #Restart a previously saved game
  end
end
