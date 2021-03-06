class GamePiece < ActiveRecord::Base

	#self.primary_key = :id
	#validates :id, presence: true
	#self.foreign_key = :game_id
  #validates :game, presence: true

  belongs_to :game, :class_name => 'Game'

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

  def move(new_x, new_y)
      self.update_attributes x: new_x.to_s
      self.update_attributes y: new_y.to_s
  end

  def valid_piece_move?(x, y)
  end

  def valid_pawn_attack?(x1, y1, x2, y2)
  end
  
 	def convert_x(str_x)
		str_x.ord.to_i - 48
	end

	def convert_y(str_y)
		str_y.to_i
	end

end