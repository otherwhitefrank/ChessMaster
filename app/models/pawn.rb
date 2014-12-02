class Pawn < GamePiece

	def valid_piece_move?(x, y)
		if self.x == x
			if self.y == y - 1
				true
			else
				false
			end
		else
			false
		end
	end

end