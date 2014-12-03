require 'rails_helper'

RSpec.describe GamePiece, :type => :model do
  let(:new_game_piece) { GamePiece.create(x: 1, y: 1, type: 'Pawn', game_board_id: 0, created_at: Time.now, updated_at: Time.now) }

  it "returns x as 1" do
    expect(new_game_piece.x).to eq(1)
  end

  it "returns y as 1" do
    expect(new_game_piece.y).to eq(1)
  end

  it "returns type as Pawn" do
    expect(new_game_piece.type).to eq('Pawn')
  end

  it "returns game_board_id as 0" do
    expect(new_game_piece.game_board_id).to eq(0)
  end

  it "moves pawn to position (1, 2)" do
    new_game_piece.move(1, 2)
    expect(new_game_piece.x).to eq(1)
    expect(new_game_piece.y).to eq(2)
  end

  it "doesn't move pawn to position (2, 3)" do
    new_game_piece.move(2, 3)
    expect(new_game_piece.x).to eq(1)
    expect(new_game_piece.y).to eq(1)
  end
  
end