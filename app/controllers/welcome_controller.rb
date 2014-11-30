class WelcomeController < ApplicationController
  def start_game
    #Start a game with the next active player
    player_1 = current_user

    #Find players that are active and not playing



  end

  def home
    #base welcome page
  end

  def start_game_with_player
    #Start a game with a specific player
    player_1 = current_user
    player_2 = params[:second_player]

    #Start game
  end

  def continue_game
    #Restart a previously saved game
  end


end
