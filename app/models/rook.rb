class Rook < GamePiece
	def valid_piece_move?(x, y)
		if(self.x == x || self.y == y)
			true
		else
			false
		end
  end
end
