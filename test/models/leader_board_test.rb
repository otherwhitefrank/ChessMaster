require 'test_helper'

class LeaderBoardTest < ActiveSupport::TestCase
  describe "Leaderboard object" do
    describe "#new" do
      it "takes three parameters and returns a Book object" do
        @book.should be_an_instance_of Book
      end
    end

  end
    # test "the truth" do
  #   assert true
  # end
end
