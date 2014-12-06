class Pawn < GamePiece

	def valid_piece_move?(x, y)
		int_x = convert_x(self.x)
		int_y = convert_y(self.y)
		if int_x == x
			if int_y == y - 1
				true
			else
				false
			end
		else
			false
		end
	end

end