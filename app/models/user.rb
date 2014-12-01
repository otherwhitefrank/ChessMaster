class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :player

  attr_accessor :updated_at, :playing_game

  after_initialize do
    init_player
    update_time
    puts "User has been initialized!"
  end

  def init_player
    puts "Creating new Player object"
    new_player = Player.create
    new_player.user = self
  end

  def update_time
    "Updated updated_at time"
    self[:updated_at] = Time.now
  end

  def online?
    updated_at > 10.minutes.ago
  end

end
