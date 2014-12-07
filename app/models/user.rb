class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #self.primary_key = :id
  #validates :id, presence: true

  validates :username,
  :uniqueness => {
    :case_sensitive => false
  }

  has_one :game, :class_name => 'Game'

  attr_accessor :updated_at, :playing_game, :login
  attr_accessor :wins
  attr_accessor :losses

  after_initialize do
    update_time
    puts "User has been initialized!"
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

  def won_game!
    @wins = @wins + 1
  end

  def lost_game!
    @losses = @losses + 1
  end
end
