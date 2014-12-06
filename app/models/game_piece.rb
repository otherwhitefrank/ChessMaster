class GamePiece < ActiveRecord::Base

	#self.primary_key = :id
	#validates :id, presence: true
	#self.foreign_key = :game_id
  #validates :game, presence: true

  belongs_to :game, :class_name => 'Game'

	attr_accessor :x
	attr_accessor :y
	attr_accessor :type

	scope :pawns, -> { where(type: 'Pawn') } 
	scope :bishops, -> { where(type: 'Bishop') } 
	scope :knights, -> { where(type: 'Knight') } 
	scope :rooks, -> { where(type: 'Rook') } 
	scope :queens, -> { where(type: 'Queen') } 
	scope :kings, -> { where(type: 'King') } 

  after_initialize do
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