class Game < ActiveRecord::Base

  attr_reader :title
  validates :title, presence: true, uniqueness: true
  validate :valid_game_file_included
  has_many :play_tokens

  def player_wins
    play_tokens.where(won: true).length
  end

  def player_losses
    play_tokens.where(won: false).length
  end

  def total_plays
    play_tokens.length
  end

  def valid_game_file_included
    begin
      test_game = title.classify.constantize.new()

      required_methods = {

        :play_turn => "requires a play turn method!",
        :won? => "requires a method to check for win state!",
        :lost? => "requires a method to check for loss state!",
        :current_state => "requires a method to check for ongoing state!"

      }

      required_methods.each do |method, error_message|
        unless test_game.has_method? method
          errors.add(:game, required_methods[method])
        end
      end

    rescue NameError
      errors.add(:game, "file has not yet been added or game is invalid.")
    end
  end

end
