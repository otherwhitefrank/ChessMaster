class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :player

  validates :username,
  :uniqueness => {
    :case_sensitive => false
  }

  attr_accessor :updated_at, :playing_game, :login

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

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
