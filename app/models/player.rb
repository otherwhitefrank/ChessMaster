class Player < ActiveRecord::Base
	belongs_to :user
	has_one :player_profile
end
