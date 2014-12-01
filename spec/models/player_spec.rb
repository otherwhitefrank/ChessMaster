require 'rails_helper'

RSpec.describe Player, :type => :model do
  let(:new_player) { Player.create(id: 1, game_id: 1, wins: 0, losses: 0, user_name: 'Frank Dye', user_id: 1, created_at: Time.now, updated_at: Time.now) }

  it "returns 1 as id" do
    expect(new_player.id).to eq(1)
  end

  it "returns game_id as 1" do
    expect(new_player.game_id).to eq(1)
  end

  it "returns wins as 0" do
    expect(new_player.wins).to eq(0)
  end

  it "returns wins as 1 when incremented" do
    new_player.won_game!
    expect(new_player.wins).to eq(1)
  end

  it "returns losses as 0" do
    expect(new_player.wins).to eq(0)
  end

  it "returns losses as 1 when incremented" do
    new_player.lost_game!
    expect(new_player.losses).to eq(1)
  end

  it "returns user_name as Frank Dye" do
    expect(new_player.user_name).to eq("Frank Dye")
  end
end