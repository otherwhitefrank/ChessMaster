class GameBoard < ActiveRecord::Base
	has_one :player_1, :class_name => 'Player'
	has_one :player_2, :class_name => 'Player'
end
