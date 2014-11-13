class GameBoard < ActiveRecord::Base
	has_many :game_piece

	def move
	end

	def valid_move?
	end

	def check?
	end

	def checkmate?
	end

	def promote_pawn
	end

	def clear_path?
	end

	def capture_piece
	end

	def open_square?
	end

end
