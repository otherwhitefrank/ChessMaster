class GamePiece < ActiveRecord::Base
	def self.piecetypes
      %w(Pawn Bishop Knight Rook King Queen)
    end
end
