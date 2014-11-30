require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe "User object" do
    before :each do
      @user = User.new
    end

    describe "#new" do
      it "takes no parameters and returns a Book object" do
        @book.should be_an_instance_of Book
      end
    end

  end

  # test "the truth" do
  #   assert true
  # end
end
