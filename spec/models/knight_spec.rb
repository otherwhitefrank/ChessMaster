require 'rails_helper'

RSpec.describe Knight, :type => :model do
  let(:new_knight) { Knight.create(x: 3, y: 3, type: 'Knight', game_id: 0, created_at: Time.now, updated_at: Time.now) }

  it "returns type as Knight" do
    expect(new_knight.type).to eq('Pawn')
  end

  it "returns true when move is 2 squares ahead and one square to the left of current position" do
    expect(new_knight.valid_piece_move?(2, 5)).to eq(true)
  end

  it "returns true when move is 2 squares to the right and one square behind current position" do
    expect(new_knight.valid_piece_move?(4, 1)).to eq(true)
  end

  it "returns false when move is strictly vertical" do
    expect(new_knight.valid_piece_move?(3, 5)).to eq(false)
  end

  it "returns false when move is strictly lateral" do
    expect(new_knight.valid_piece_move?(5, 3)).to eq(false)
  end
end