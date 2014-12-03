require 'rails_helper'

RSpec.describe GamePiece, :type => :model do
  let(:new_game_piece) { GamePiece.create(x: 1, y: 1, type: 'Pawn', game_id: 0, created_at: Time.now, updated_at: Time.now) }

  it "returns x as 1" do
    expect(new_game_piece.x).to eq(1)
  end

  it "returns y as 1" do
    expect(new_game_piece.y).to eq(1)
  end

  it "returns type as Pawn" do
    expect(new_game_piece.type).to eq('Pawn')
  end

  it "returns game_id as 0" do
    expect(new_game_piece.game_id).to eq(0)
  end

  
end