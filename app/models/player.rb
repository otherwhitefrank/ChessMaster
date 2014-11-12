class Player < ActiveRecord::Base
	validates :user_name, presence: true
	validates :user_id, presence: true

	belongs_to :user
	has_one :player_profile
end
