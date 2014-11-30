class Player < ActiveRecord::Base
	attr_accessor :wins
	attr_accessor :losses
	attr_accessor :user_name

	validates :user_name, presence: true
	validates :user_id, presence: true

	belongs_to :user
	has_one :player_profile

end
