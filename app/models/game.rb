class Game < ActiveRecord::Base
	validates :game_id, presence: true

	has_one :game_board
	has_one :player_1, :class_name => 'Player'
	has_one :player_2, :class_name => 'Player'
	has_one :timer
end
