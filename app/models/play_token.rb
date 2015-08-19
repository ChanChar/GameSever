class PlayToken < ActiveRecord::Base
  validates :token, :user_id, :game_id, presence: true
  has_many :turns
  belongs_to :user
  belongs_to :game

  def generate_token_suffix
    SecureRandom.urlsafe_base64
  end

  def valid_token?(token)
    !(token.nil? || token.won || token.expire_at > Time.now)
  end
end
