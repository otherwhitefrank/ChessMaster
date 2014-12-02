require 'rails_helper'

RSpec.describe Bishop, :type => :model do
  let(:new_bishop) { Bishop.create(x: 1, y: 1, type: 'Bishop', game_id: 0, created_at: Time.now, updated_at: Time.now) }

  it "returns type as Bishop" do
    expect(new_bishop.type).to eq('Bishop')
  end

  it "returns true when move is" do
    expect(new_bishop.valid_piece_move?(1, 7)).to eq(true)
  end

  it "returns false when move is" do
    expect(new_bishop.valid_piece_move?(7, 1)).to eq(true)
  end

end