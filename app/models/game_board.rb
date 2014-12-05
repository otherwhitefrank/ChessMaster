class GameBoard < ActiveRecord::Base
	has_many :game_piece
  belongs_to :game

  validates :id, presence: true 

  after_initialize do
    # Create pieces at default position
    #init_pieces
    puts "Board has been initialized!"
  end

  def init_pieces
  	self.game_piece << GamePiece.new(char_x: 'A', x: 1, y: 2, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'B', x: 2, y: 2, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'C', x: 3, y: 2, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'D', x: 4, y: 2, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'E', x: 5, y: 2, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'F', x: 6, y: 2, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'G', x: 7, y: 2, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'H', x: 8, y: 2, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'A', x: 1, y: 1, type: 'Rook')
  	self.game_piece << GamePiece.new(char_x: 'H', x: 8, y: 1, type: 'Rook')
  	self.game_piece << GamePiece.new(char_x: 'B', x: 2, y: 1, type: 'Knight')
  	self.game_piece << GamePiece.new(char_x: 'G', x: 7, y: 1, type: 'Knight')
  	self.game_piece << GamePiece.new(char_x: 'C', x: 3, y: 1, type: 'Bishop')
  	self.game_piece << GamePiece.new(char_x: 'F', x: 6, y: 1, type: 'Bishop')
  	self.game_piece << GamePiece.new(char_x: 'D', x: 4, y: 1, type: 'Queen')
  	self.game_piece << GamePiece.new(char_x: 'E', x: 5, y: 1, type: 'King')

  	self.game_piece << GamePiece.new(char_x: 'A', x: 1, y: 7, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'B', x: 2, y: 7, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'C', x: 3, y: 7, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'D', x: 4, y: 7, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'E', x: 5, y: 7, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'F', x: 6, y: 7, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'G', x: 7, y: 7, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'H', x: 8, y: 7, type: 'Pawn')
  	self.game_piece << GamePiece.new(char_x: 'A', x: 1, y: 8, type: 'Rook')
  	self.game_piece << GamePiece.new(char_x: 'H', x: 8, y: 8, type: 'Rook')
  	self.game_piece << GamePiece.new(char_x: 'B', x: 2, y: 8, type: 'Knight')
  	self.game_piece << GamePiece.new(char_x: 'G', x: 7, y: 8, type: 'Knight')
  	self.game_piece << GamePiece.new(char_x: 'C', x: 3, y: 8, type: 'Bishop')
  	self.game_piece << GamePiece.new(char_x: 'F', x: 6, y: 8, type: 'Bishop')
  	self.game_piece << GamePiece.new(char_x: 'D', x: 4, y: 8, type: 'Queen')
  	self.game_piece << GamePiece.new(char_x: 'E', x: 5, y: 8, type: 'King')
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
