class Game < ActiveRecord::Base

	validates :game_id, presence: true

	has_one :game_board
	has_one :player_1, :class_name => 'Player'
	has_one :player_2, :class_name => 'Player'
	has_one :timer

	def active?
		true
	end

	def who_won?
	end

	def whose_turn?
	end

  def initiate_game(player_1, player_2, match_time)
    player_1 = player_1
    player_2 = player_2

    GameBoard.create

  end

end
