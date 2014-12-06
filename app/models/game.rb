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
		self.current_turn = "white"

    self.unique_channel_id = unique_channel_id
		self.white_timer = match_time
		self.black_timer = match_time
	end

	def init_pieces
		self.game_piece << GamePiece.new(x: 1, y: 2, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 2, y: 2, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 3, y: 2, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 4, y: 2, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 5, y: 2, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 6, y: 2, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 7, y: 2, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 8, y: 2, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 1, y: 1, type: 'Rook', game_id: self)
		self.game_piece << GamePiece.new(x: 8, y: 1, type: 'Rook', game_id: self)
		self.game_piece << GamePiece.new(x: 2, y: 1, type: 'Knight', game_id: self)
		self.game_piece << GamePiece.new(x: 7, y: 1, type: 'Knight', game_id: self)
		self.game_piece << GamePiece.new(x: 3, y: 1, type: 'Bishop', game_id: self)
		self.game_piece << GamePiece.new(x: 6, y: 1, type: 'Bishop', game_id: self)
		self.game_piece << GamePiece.new(x: 4, y: 1, type: 'Queen', game_id: self)
		self.game_piece << GamePiece.new(x: 5, y: 1, type: 'King', game_id: self)

		self.game_piece << GamePiece.new(x: 1, y: 7, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 2, y: 7, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 3, y: 7, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 4, y: 7, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 5, y: 7, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 6, y: 7, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 7, y: 7, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 8, y: 7, type: 'Pawn', game_id: self)
		self.game_piece << GamePiece.new(x: 1, y: 8, type: 'Rook', game_id: self)
		self.game_piece << GamePiece.new(x: 8, y: 8, type: 'Rook', game_id: self)
		self.game_piece << GamePiece.new(x: 2, y: 8, type: 'Knight', game_id: self)
		self.game_piece << GamePiece.new(x: 7, y: 8, type: 'Knight', game_id: self)
		self.game_piece << GamePiece.new(x: 3, y: 8, type: 'Bishop', game_id: self)
		self.game_piece << GamePiece.new(x: 6, y: 8, type: 'Bishop', game_id: self)
		self.game_piece << GamePiece.new(x: 4, y: 8, type: 'Queen', game_id: self)
		self.game_piece << GamePiece.new(x: 5, y: 8, type: 'King', game_id: self)
	end


	def convert_to_ascii(char_x)
		char_x.ord - 64
	end

	def find_piece(char_x, y)
		GamePiece.find_by_char_x_and_y(char_x, y).type
	end

	def move(x1, y1, x2, y2)
		if valid_move?(x1, y1, x2, y2)
			find_piece(x1, y1).move(x2, y2)
		end
	end

	def switch_player_turn
		if (self.current_turn == "white")
			self.current_turn = "black"
		elsif (self.current_turn == "black")
			self.current_turn = "white"
		end
	end

	def valid_move?(player_id, x1, y1, x2, y2)
		#Is it the players turn?
		if (players_turn?(player_id))
			#is the move okau?
			#is someone inbetween
			#Players turn so check if the piece can move there
			switch_player_turn()

			return true
		else
			#not players turn
			return false
		end
	end

	def check?
	end

	def players_turn?(player_id)
		if (player_id.to_i == player_1.id)
			if (self.current_turn == "white")
				#Okay to play, player_1 is white
				return true
			else
				return false
			end
		elsif (player_id.to_i == player_2.id)
			if (self.current_turn == "black")
				#Okay to play, player_2 is black
				return true
			else
				return false
			end
		end
	end

	def checkmate?
	end

	def promote_pawn
	end

	def clear_path?
	end

	def capture_piece
	end

	def open_square?(x, y)
		if find_piece(x, y) == nil
			true
		end
		false
	end

	def within_board?(x, y)
		if 0 <= x < 8
			if 0 <= y < 8
				true
			else
				false
			end
		else
			false
		end
	end

end
