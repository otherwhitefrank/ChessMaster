class GameBoard < ActiveRecord::Base
	has_many :game_piece
end
