require 'rails_helper'

RSpec.describe Rook, :type => :model do
  let(:new_rook) { Rook.create(x: 1, y: 1, type: 'Rook', game_id: 0, created_at: Time.now, updated_at: Time.now) }

  it "returns type as Rook" do
    expect(new_rook.type).to eq('Rook')
  end

  it "returns true when move is exclusively horizontal" do
    expect(new_rook.valid_piece_move?(7, 1)).to eq(true)
  end

  it "returns false when move is exclusively vertical" do
    expect(new_rook.valid_piece_move?(1, 7)).to eq(true)
  end

end