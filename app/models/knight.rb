class Knight < GamePiece

	def valid_piece_move?(x,y)
		if(self.x == x + 1 || self.x == x - 1)
			if(self.y == y + 2 || self.y == y - 2)
				return true
			end
		elsif(self.x == x + 2 || self.x == x - 2)
			if(self.y == y + 1 || self.y == y - 1)
				return true
			end		
		end
		return false
	end
end
