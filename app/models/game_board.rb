class GameBoard < ActiveRecord::Base
	has_many :game_piece
  belongs_to :game

  def after_initialize
    #Create pieces at default position
    pawn1 = Pawn.create()
    pawn1.game_board = self
    pawn1.x = 'C'
    pawn1.y = '2'


  end

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

	def within_board?
	end

end
