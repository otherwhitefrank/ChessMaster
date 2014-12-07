class Pawn < GamePiece

	def valid_piece_move?(new_x, new_y)
		x = convert_x(self.x)
		y = convert_y(self.y)
		if x == new_x && self.color == 'black'
			if y == new_y - 1
				return true
			end
		elsif x == new_x && self.color == 'white'
			if y == new_y + 1
				return true
			end
		end
		return false
	end

end