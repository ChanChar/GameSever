class Game < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :play_tokens

  def create_game_token(username, game_id)
    "#{username}-#{game_id}-#{PlayToken.generate_token_suffix}"
  end

end
