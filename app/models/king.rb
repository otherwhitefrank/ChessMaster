class King < GamePiece

	def valid_piece_move?(x, y)
		if (self.x == x)
			if(self.y == y - 1 || self.y == y + 1)
				return true
			end
		elsif (self.x == x + 1 || self.x == x - 1)
			if(self.y == y || self.y == y + 1 || self.y == y - 1)
				return true
			end
		end
		return false
	end
end
