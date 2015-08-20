require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:hangman) { Game.new(:title => "Hangman") }

  it "validates presence of title" do
    expect(hangman).to be_valid
  end

  it "allows only one version of the game to exist" do
    first_game = Game.new(:title => "Hangman")
    copy_game = Game.new(:title => "Hangman")
    first_game.save
    copy_game.save
    expect(copy_game.errors[:title]).to include("has already been taken")
  end

end
