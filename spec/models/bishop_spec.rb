require 'rails_helper'

RSpec.describe Bishop, :type => :model do
  let(:new_bishop) { Bishop.create(x: 3, y: 3, type: 'Bishop', game_id: 0, created_at: Time.now, updated_at: Time.now) }

  it "returns type as Bishop" do
    expect(new_bishop.type).to eq('Bishop')
  end

  it "returns true when piece moves forward and right" do
    expect(new_bishop.valid_piece_move?(5, 5)).to eq(true)
  end

  it "returns true when piece moves forward and left" do
    expect(new_bishop.valid_piece_move?(1, 5)).to eq(true)
  end

  it "returns true when piece moves backward and right" do
    expect(new_bishop.valid_piece_move?(5, 1)).to eq(true)
  end

  it "returns true when piece moves backward and left" do
    expect(new_bishop.valid_piece_move?(1, 1)).to eq(true)
  end

end