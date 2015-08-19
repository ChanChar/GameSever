class Game < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :play_tokens

  def create_game_token(username, game_id)
    "#{username}-#{game_id}-#{PlayToken.generate_token_suffix}"
  end

  def player_wins
    play_tokens.where(won: true).length
  end

  def player_losses
    play_tokens.where(won: false).length
  end

  def total_plays
    play_tokens.length
  end

end
