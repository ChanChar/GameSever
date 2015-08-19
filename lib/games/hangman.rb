require 'set'
class Hangman

  def initialize
    @mystery_word = get_random_word.split
    @guessed_letters = Set.new
    @display = []
    @number_of_guesses = 0
  end

  def play_turn(directions)
    direction, letter = directions.split
    case direction.downcase
    when "guess"
      @guessed_letters << letter.downcase
      @number_of_guesses += 1
    # Can add more functionality
    # when "used_letters"
    # when "guesses_left"
    # when "etc"
    end
  end

  def won?
    @mystery_word.all? {|letter| @guessed_letters.include?(letter)}
  end

  def lost?
    @number_of_guesses > 6
  end

  def current_state
    @mystery_word.each do |letter|
      if @guessed_letters.include?(letter)
        @display << letter
      else
        @display << "___"
      end
    end

    @mystery_word.join(' ')
  end

  def get_random_word
    ['sample', 'hangman', 'random'].sample
  end

end
