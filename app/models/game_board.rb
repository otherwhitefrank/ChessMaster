class GameBoard < ActiveRecord::Base
	has_many :game_piece
  belongs_to :game

  after_initialize do
    # Create pieces at default position
    pawn1 = GamePiece.new(type: 'Pawn')
    puts "Board has been initialized!"
  end

  def add_piece
  	self.game_piece.create(type: 'Pawn')
  end

  def convert_to_ascii(char_x)
  	char_x.ord - 64
  end

	def find_piece(char_x, y)
		GamePiece.find_by_char_x_and_y(char_x, y).type
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
			else
				false
			end
		else
			false
		end
	end

end
