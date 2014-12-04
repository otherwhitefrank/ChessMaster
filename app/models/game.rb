class Game < ActiveRecord::Base

	validates :id, presence: true

	has_one :game_board

	has_one :player_1, :class_name => 'Player'
	has_one :player_2, :class_name => 'Player'
  has_one :unique_channel_id
	has_one :timer

	after_initialize do
		game_board = GameBoard.create
		game_board.game = self
	end

	def active?
		true
	end

	def who_won?
	end

	def whose_turn?
	end

  def initiate_game(player_1, player_2, unique_channel_id, match_time)
    @player_1 = player_1
    @player_2 = player_2

    @unique_channel_id = unique_channel_id
	end

	def get_game_from_channel_id ( channel_id)
		games = Game.all

		games.each do |curr_game|
			if (curr_game.unique_channel_id === channel_id)
				return self
			end
		end
	end

end
