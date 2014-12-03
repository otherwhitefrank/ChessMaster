class Queen < GamePiece

	def valid_piece_move?(x, y)
		if(self.x == x || self.y == y)
			return true
		else
			(1..6).each do |i|
				if(self.x + i == x || self.x - i == x)
					if(self.y + i == y || self.y - i == y)
						return true
					end
				end
			end
		end
		return false
	end
end
