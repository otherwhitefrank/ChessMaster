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
    @player_1 = player_1
    @player_2 = player_2

    @unique_channel_id = unique_channel_id
		@white_time = match_time
		@black_time = match_time
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

	def valid_move?(x1, y1, x2, y2)
		if condition
			true
		end
		false
	end

	def check?
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
