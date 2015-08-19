class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
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
end
