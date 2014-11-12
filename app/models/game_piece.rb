class GamePiece < ActiveRecord::Base
	def self.types
      %w(Pawn Bishop Knight Rook King Queen)
    end
end
