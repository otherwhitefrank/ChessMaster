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

	def find_piece(x, y)
		GamePiece.find_by_x_and_y(params[:x],params[:y])
	end

	def move(x1, y1, x2, y2)
		if valid_move?(x1, y1, x2, y2)
			find_piece(x1, y1).move(x2, y2)
		end
	end

	def valid_move?(x1, y1, x2, y2)
		if condition
			true
		end
		false	
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

	def open_square?(x, y)
		if find_piece(x, y) == nil
			true
		end
		false
	end

	def within_board?(x, y)
		if 0 <= x < 8
			if 0 <= y < 8
				true
			end
		end
		false
	end

end
