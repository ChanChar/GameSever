class PlayToken < ActiveRecord::Base
  attr_accessor :won, :complete
  validates :token, :user_id, :game_id, presence: true
  has_many :turns
  belongs_to :user
  belongs_to :game

  def self.generate_token_suffix
    SecureRandom.urlsafe_base64
  end

  def valid_token?
    self.nil? || self.won || self.complete || self.expire_at < Time.now
  end

  def self.create_game_token(username, game_id)
    "#{username}-#{game_id}-#{generate_token_suffix}"
  end

end
