class GamePiece < ActiveRecord::Base
	def self.types
        %w(Pawn Bishop Knight Rook Queen King)
    end
end
