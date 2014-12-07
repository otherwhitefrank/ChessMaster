class Rook < GamePiece
	def valid_piece_move?(new_x, new_y)
    x = convert_x(self.x)
    y = convert_x(self.y)
		if(x == new_x || y == new_y)
			true
		else
			false
		end
  end
end
