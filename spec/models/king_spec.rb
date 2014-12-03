require 'rails_helper'

RSpec.describe King, :type => :model do
  let(:new_king) { King.create(x: 3, y: 3, type: 'King', game_board_id: 0, created_at: Time.now, updated_at: Time.now) }

  it "returns type as King" do
    expect(new_king.type).to eq('King')
  end

  it "returns true when piece moves forward one square" do
    expect(new_king.valid_piece_move?(3, 4)).to eq(true)
  end

  it "returns true when piece moves left one square" do
    expect(new_king.valid_piece_move?(2, 3)).to eq(true)
  end

  it "returns true when piece moves forward and left one square" do
    expect(new_king.valid_piece_move?(4, 4)).to eq(true)
  end

  it "returns false when piece moves multiple squares" do
    expect(new_king.valid_piece_move?(3, 5)).to eq(false)
  end
end