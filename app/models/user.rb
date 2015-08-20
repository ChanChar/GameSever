class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validate :valid_username_characters
  has_many :play_tokens
  has_many :games, through: :play_tokens

  def wins
    play_tokens.where(won: true).count
  end

  def losses
    play_tokens.where(won: false).count
  end

  def total
    wins + losses
  end

  def invalidate_last_token
    if self.play_tokens.length > 0
      self.play_tokens.last.toggle!(:complete)
    end
  end

  # Can add more illegal characters
  def valid_username_characters
    if username.include?('-')
       errors.add(:user, "contains illegal characters [-]")
     end
  end
end
