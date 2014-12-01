class King < GamePiece

	def valid_piece_move?(x, y)
		if self.x = x
			if(self.y == y - 1 || self.y == y + 1)
				true
			end
		elsif self.y = y
			if(self.x == x - 1 || self.x == y + 1)
				true
			end
		elsif self.x = x + 1
			if(self.y == y - 1 || self.y == y + 1)
				true
			end
		elsif self.x = x - 1
			if(self.y == y - 1 || self.y == y + 1)
				true
			end
		end
		false
	end

end
