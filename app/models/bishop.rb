class Bishop < GamePiece

	def valid_piece_move?(x, y)
		if(self.x == x && self.y == x)
			true
		end
  end
end
