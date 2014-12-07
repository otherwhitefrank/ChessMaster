class Knight < GamePiece

	def valid_piece_move?(new_x, new_y)
    x = convert_x(self.x)
    y = convert_x(self.y)
		if(x == new_x + 1 || x == new_x - 1)
			if(y == new_y + 2 || y == new_y - 2)
				return true
			end
		elsif(x == new_x + 2 || x == new_x - 2)
			if(y == new_y + 1 || y == new_y - 1)
				return true
			end		
		end
		return false
	end
end
