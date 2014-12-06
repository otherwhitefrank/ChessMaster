class Queen < GamePiece

	def valid_piece_move?(new_x, new_y)
		x = convert_x(self.x)
		y = convert_x(self.y)
		if(x == new_x || y == new_y)
			return true
		else
			(1..6).each do |i|
				if(x + i == new_x || x - i == new_x)
					if(y + i == new_y || y - i == new_y)
						return true
					end
				end
			end
		end
		return false
	end
end
