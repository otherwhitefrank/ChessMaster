class WelcomeController < ApplicationController
  attr_accessor :player_1, :player_2

  def start_game
    player_1_id = params[:active_user]
    player_2_id = params[:selected_user]

    @player_1 = User.find(player_1_id)
    @player_2 = User.find(player_2_id)

    puts @player_1.email
    puts @player_2.email
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
