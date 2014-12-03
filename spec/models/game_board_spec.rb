require 'rails_helper'

RSpec.describe GameBoard, :type => :model do
  let(:new_game_board) { GameBoard.create(id: 1) }
  let(:pawn1) { GamePiece.create(char_x: 'C', x: 3, y: 2, type: 'Pawn', game_board_id: 1, created_at: Time.now, updated_at: Time.now) }

  it "looks for all game pieces it has" do
    expect(new_game_board.pawn1.to eq('Pawn'))
  end

  it "finds piece at position with x coordinate 'C' and y coordinate '3'" do
    expect(new_game_board.find_piece('C', 2)).to eq('Pawn')
  end

end