class Pawn < GamePiece

	def valid_piece_move?(new_x, new_y)
		x = convert_x(self.x)
		y = convert_y(self.y)
		if x == new_x && self.color == 'black'
			if y == new_y - 1 || (y == new_y - 2 && y == 2)
				return true
			end
		elsif x == new_x && self.color == 'white'
			if y == new_y + 1 || (y == new_y + 2 && y == 7)
				return true
			end
		end
		return false
  end

  def valid_pawn_attack?(new_x, new_y)
    x = convert_x(self.x)
    y = convert_y(self.y)
    if (x == new_x + 1 || x == new_x - 1) && self.color == 'black'
      if y == new_y - 1
        return true
      end
    elsif (x == new_x + 1 || x == new_x - 1) && self.color == 'white'
      if y == new_y + 1
        return true
      end
    end
    return false
  end

end