class Player < ActiveRecord::Base
	attr_accessor :wins
	attr_accessor :losses
	attr_accessor :user_name

	validates :user_name, presence: true
	validates :user_id, presence: true

	belongs_to :user
	has_one :player_profile

  after_initialize do
    init_player_profile
    puts "Player has been initialized!"
  end

  def init_player_profile
    puts "Creatng new Player Profile object"
    new_player_profile = PlayerProfile.create
    new_player_profile.player = self
  end

  def won_game!
    @wins = @wins +1
  end

  def lost_game!
    @losses = @losses +1
  end

end
