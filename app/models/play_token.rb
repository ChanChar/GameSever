class PlayToken < ActiveRecord::Base
  validates :token, :user_id, :game_id, presence: true
  belongs_to :user
  belongs_to :game

  def generate_token_suffix
    SecureRandom.urlsafe_base64
  end

  def valid_token?(token)
    check_token = PlayToken.where("token: ?", token)
    !(check_token.nil? || check_token.won || check_token.expire_at > Time.now)
  end
end
