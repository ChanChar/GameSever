require 'set'
class Hangman
  attr_reader :mystery_word, :display, :number_of_guesses

  def initialize(word)
    @mystery_word = word || get_random_word
    @guessed_letters = Set.new
    @display = []
    @number_of_guesses = 0
  end

  def play_turn(directions)
    direction, letter = directions.split
    case direction.downcase
    when "guess"
      @guessed_letters << letter.downcase
      @number_of_guesses += 1 unless @mystery_word.chars.include?(letter.downcase)
    # Can add more functionality
    # when "used_letters"
    # when "guesses_left"
    # when "etc"
    end
  end

  def won?
    @mystery_word.chars.all? {|letter| @guessed_letters.include?(letter)}
  end

  def lost?
    @number_of_guesses > 6
  end

  def current_state
    @display = []
    @mystery_word.each_char do |letter|
      if @guessed_letters.include?(letter)
        @display << letter
      else
        @display << "_"
      end
    end

    "You have revealed the following: #{@display.join(' ')} and have #{6 - @number_of_guesses} guesses left!"
  end

  def get_random_word
    ['sample', 'hangman', 'random'].sample
  end

end
