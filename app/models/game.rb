class Game < ActiveRecord::Base

  #validates :id, presence: true

  belongs_to :player_1, :class_name => 'User'
  belongs_to :player_2, :class_name => 'User'
  has_many :game_piece, :class_name => 'GamePiece'

  def get_game_from_player_id(player_id)
    games = Game.all

    games.each do |curr_game|
      if ((curr_game.player_1 === player_id) || (curr_game.player_2 ===player_id) && curr_game.active?)
        return self
      end
    end
  end

  def active?
    true
  end

  def who_won?
  end

  def whose_turn?
  end

  def initiate_game(player_1, player_2, unique_channel_id, match_time)
    self.player_1 = player_1
    self.player_2 = player_2
    self.current_turn = 'white'

    self.unique_channel_id = unique_channel_id
    self.white_timer = match_time
    self.black_timer = match_time
  end

  def init_pieces
    self.game_piece << GamePiece.new(x: 1, y: 2, type: 'Pawn', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 2, y: 2, type: 'Pawn', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 3, y: 2, type: 'Pawn', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 4, y: 2, type: 'Pawn', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 5, y: 2, type: 'Pawn', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 6, y: 2, type: 'Pawn', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 7, y: 2, type: 'Pawn', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 8, y: 2, type: 'Pawn', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 1, y: 1, type: 'Rook', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 8, y: 1, type: 'Rook', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 2, y: 1, type: 'Knight', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 7, y: 1, type: 'Knight', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 3, y: 1, type: 'Bishop', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 6, y: 1, type: 'Bishop', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 4, y: 1, type: 'Queen', color: 'black', game_id: self.id)
    self.game_piece << GamePiece.new(x: 5, y: 1, type: 'King', color: 'black', game_id: self.id)

    self.game_piece << GamePiece.new(x: 1, y: 7, type: 'Pawn', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 2, y: 7, type: 'Pawn', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 3, y: 7, type: 'Pawn', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 4, y: 7, type: 'Pawn', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 5, y: 7, type: 'Pawn', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 6, y: 7, type: 'Pawn', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 7, y: 7, type: 'Pawn', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 8, y: 7, type: 'Pawn', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 1, y: 8, type: 'Rook', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 8, y: 8, type: 'Rook', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 2, y: 8, type: 'Knight', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 7, y: 8, type: 'Knight', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 3, y: 8, type: 'Bishop', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 6, y: 8, type: 'Bishop', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 4, y: 8, type: 'Queen', color: 'white', game_id: self.id)
    self.game_piece << GamePiece.new(x: 5, y: 8, type: 'King', color: 'white', game_id: self.id)
  end


  def convert_x(str_x)
    str_x.ord.to_i - 96
  end

  def convert_y(str_y)
    str_y.to_i
  end

  def find_piece(x, y)
    GamePiece.find_by(x: convert_x(x).to_s , y: convert_y(y).to_s, game_id: self.id)
  end

  def move(str_x1, str_y1, str_x2, str_y2)
    piece = find_piece(str_x1, str_y1)
    x2 = convert_x(str_x2)
    y2 = convert_y(str_y2)
    #delete old piece at attempted square if piece is present
    piece.move(x2, y2)
  end

  def switch_player_turn
    if (self.current_turn == 'white')
      self.update_attributes current_turn: 'black'
    elsif (self.current_turn == 'black')
      self.update_attributes current_turn: 'white'
    end
  end

  def valid_move?(player_id, str_x1, str_y1, str_x2, str_y2)
    if players_turn?(player_id)
      if(my_piece?(str_x1, str_y1))
        if diff_square?(str_x1, str_y1, str_x2, str_y2)
          if clear_path?(str_x1, str_y1, str_x2, str_y2)
            piece = find_piece(str_x1, str_y1)
            x2 = convert_x(str_x2)
            y2 = convert_y(str_y2)
            if find_piece(str_x2, str_y2) == nil || same_team?(str_x1, str_y1, str_x2, str_y2) == false
              if piece.type == 'Pawn' && find_piece(str_x2, str_y2) != nil && piece.valid_pawn_attack?(x2, y2)
                return true
              elsif piece.valid_piece_move?(x2, y2)
                return true
              end
            end
          end
        end
      end
    end
    #not players turn
    return false
  end

  def players_turn?(player_id)
    if player_id.to_i == player_1.id
      if self.current_turn == "white"
        #Okay to play, player_1 is white
        return true
      else
        return false
      end
    elsif player_id.to_i == player_2.id
      if self.current_turn == "black"
        #Okay to play, player_2 is black
        return true
      else
        return false
      end
    end
  end

  def check?(player_id)
    x = (GamePiece.find_by type: 'King', color: self.current_turn).x
    str_x = (x.to_i + 96).chr.to_s
    str_y = (GamePiece.find_by type: 'King', color: self.current_turn).y
    (1..8) .each do |i|
      str_i = (i + 96).chr.to_s
      (1..8) .each do |j|
        str_j = j.to_s
        if find_piece(i, j) != nil
          if valid_move?(player_id, str_i, str_j, str_x, str_y)
            true
          end
        end
      end
    end
    false
  end

  def checkmate?(player_id)
    (str_x - 1..str_x + 1) .each do |i|
      str_i = (i + 96).chr.to_s
      (str_y - 1..str_y + 1) .each do |j|
        str_j = j.to_s
        if valid_move?(player_id, str_x, str_y, str_i, str_j)
          false
        end
      end
    end
    true
  end

  def promote_pawn
  end

  def clear_path?(char_x1, char_y1, char_x2, char_y2)
    x1 = convert_x(char_x1)
    y1 = convert_y(char_y1)
    x2 = convert_x(char_x2)
    y2 = convert_y(char_y2)
    if find_piece(char_x1, char_y1).type == 'Rook'
      return clear_path_rook?(x1, y1, x2, y2)
    elsif find_piece(char_x1, char_y1).type == 'Bishop'
      return clear_path_bishop?(x1, y1, x2, y2)
    elsif find_piece(char_x1, char_y1).type == 'Queen'
      return clear_path_queen?(x1, y1, x2, y2)
    else
      return true
    end
  end

  def capture_piece(str_x1, str_y1, str_x2, str_y2)
    x2 = convert_x(str_x2)
    y2 = convert_y(str_y2)
    if open_square?(x2, y2) == false
      if (find_piece(str_x1, str_y1).color != find_piece(str_x2, str_y2).color)
        self.game_piece.delete(find_piece(str_x2, str_y2))
      end
    end
  end

  def open_square?(x, y)
    if (GamePiece.find_by(x: x.to_s , y: y.to_s, game_id: self.id)) == nil
      true
    else
      false
    end
  end

  def diff_square?(x1, y1, x2, y2)
    if (x1 == x2 && y1 == y2)
      false
    else
      true
    end
  end

  def my_piece?(str_x1, str_y1)
    if self.current_turn == find_piece(str_x1, str_y1).color
      true
    else
      false
    end
  end

  def same_team?(str_x1, str_y1, str_x2, str_y2)
    if find_piece(str_x1, str_y1).color == find_piece(str_x2, str_y2).color
      true
    else
      false
    end
  end

  def within_board?(x, y)
    if 0 < x && x <= 8
      if 0 < y && y <= 8
        true
      else
        false
      end
    else
      false
    end
  end

  def clear_path_rook?(x1, y1, x2, y2)
    if x1 == x2
      if y2 > y1
        (y1 + 1..y2 - 1).each do |i|
          if open_square?(x1, i) == false
            return false
          end
        end
      elsif y1 > y2
        (y2 + 1..y1 - 1).each do |i|
          if open_square?(x1, i) == false
            return false
          end
        end
      end
    elsif y1 == y2
      if x2 > x1
        (x1 + 1..x2 - 1).each do |i|
          if open_square?(i, y1) == false
            return false
          end
        end
      elsif x1 > x2
        (x2 + 1..x1 - 1).each do |i|
          if open_square?(i, y1) == false
            return false
          end
        end
      end
      return true
    end
  end

  def clear_path_bishop?(x1, y1, x2, y2)
    j = 0
    if x1 > x2
      if y2 > y1
        (y1 + 1..y2 - 1).each do |i|
          j = j + 1
          if open_square?(x1 - j, i) == false
            return false
          end
        end
      elsif y1 > y2
        (y1 - 1).downto(y2 + 1) do |i|
          j = j + 1
          if open_square?(x1 - j, i) == false
            return false
          end
        end
      end
    elsif x1 < x2
      if y2 > y1
        (y1 + 1..y2 - 1).each do |i|
          j = j + 1
          if open_square?(x1 + j, i) == false
            return false
          end
        end
      elsif y1 > y2
        (y1 - 1).downto(y2 + 1) do |i|
          j = j + 1
          if open_square?(x1 + j, i) == false
            return false
          end
        end
      end
    end
    return true
  end

  def clear_path_queen?(x1, y1, x2, y2)
    if x1 == x2 || y1 == y2
      if clear_path_rook?(x1, y1, x2, y2)
        true
      end
    elsif clear_path_bishop?(x1, y1, x2, y2)
      true
    else
      false
    end
  end

end
