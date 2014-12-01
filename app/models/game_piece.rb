class GamePiece < ActiveRecord::Base

  belongs_to :game_board

	attr_accessor :x
	attr_accessor :y

	scope :pawns, -> { where(type: 'Pawn') } 
	scope :bishops, -> { where(type: 'Bishop') } 
	scope :knights, -> { where(type: 'Knight') } 
	scope :rooks, -> { where(type: 'Rook') } 
	scope :queens, -> { where(type: 'Queen') } 
	scope :kings, -> { where(type: 'King') } 

	def self.types
      %w(Pawn Bishop Knight Rook King Queen)
  end

  def move(x, y)
 		if self.valid_piece_move?(x, y)
    		self.x = x
    		self.y = y
   	end
  end

  def valid_piece_move?(x, y)
  end
  
end
