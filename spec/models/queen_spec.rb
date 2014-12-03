require 'rails_helper'

RSpec.describe Queen, :type => :model do
  let(:new_queen) { Queen.create(x: 3, y: 3, type: 'Queen', game_board_id: 0, created_at: Time.now, updated_at: Time.now) }

  it "returns type as Queen" do
    expect(new_queen.type).to eq('Queen')
  end

  it "returns true when move is exclusively horizontal" do
    expect(new_queen.valid_piece_move?(7, 3)).to eq(true)
  end

  it "returns false when move is exclusively vertical" do
    expect(new_queen.valid_piece_move?(3, 7)).to eq(true)
  end

  it "returns true when piece moves forward and right" do
    expect(new_queen.valid_piece_move?(5, 5)).to eq(true)
  end

  it "returns true when piece moves forward and left" do
    expect(new_queen.valid_piece_move?(1, 5)).to eq(true)
  end

  it "returns true when piece moves backward and right" do
    expect(new_queen.valid_piece_move?(5, 1)).to eq(true)
  end

  it "returns true when piece moves backward and left" do
    expect(new_queen.valid_piece_move?(1, 1)).to eq(true)
  end

end