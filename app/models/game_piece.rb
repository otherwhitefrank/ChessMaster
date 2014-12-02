class GamePiece < ActiveRecord::Base
	attr_accessor :x
	attr_accessor :y

  validates :game_board_id, presence: true

  belongs_to :game_board

	scope :pawns, -> { where(type: 'Pawn') } 
	scope :bishops, -> { where(type: 'Bishop') } 
	scope :knights, -> { where(type: 'Knight') } 
	scope :rooks, -> { where(type: 'Rook') } 
	scope :queens, -> { where(type: 'Queen') } 
	scope :kings, -> { where(type: 'King') } 

  after_initialize do
    puts "Piece has been initialized!"
  end
    
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