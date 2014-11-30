require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:new_user) { User.create(id:1, email: "frankhdye@gmail.com") }

  it "returns email" do
    expect(new_user.email).to eq("frankhdye@gmail.com")
  end

  it "returns false if not active for 10 minutes" do
    new_user.updated_at = Time.now - 10.days
    expect(new_user.online?).to eq(false)
  end

  it "returns true if active within 10 minutes" do
    new_user.updated_at = Time.now
    expect(new_user.online?).to eq(true)
  end
end