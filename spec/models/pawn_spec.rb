require 'rails_helper'

RSpec.describe Pawn, :type => :model do
  let(:new_pawn) { Pawn.create(x: 1, y: 1, type: 'Pawn', game_id: 0, created_at: Time.now, updated_at: Time.now) }

  it "returns type as Pawn" do
    expect(new_pawn.type).to eq('Pawn')
  end

  it "returns true when move is 1 square ahead of current position" do
    expect(new_pawn.valid_piece_move?(1, 2)).to eq(true)
  end

  it "returns false when move is not 1 square ahead of current position" do
    expect(new_pawn.valid_piece_move?(1, 4)).to eq(false)
  end

  it "returns false when move is not strictly vertical" do
    expect(new_pawn.valid_piece_move?(2, 2)).to eq(false)
  end
end