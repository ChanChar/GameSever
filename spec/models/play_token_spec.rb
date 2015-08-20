require 'rails_helper'

RSpec.describe PlayToken, type: :model do

  it "correctly generates a play token based on name and game ID" do
    expect(PlayToken.create_game_token('charlie', 1)).to include('charlie')
    expect(PlayToken.create_game_token('charlie', 1)).to include('1')
  end
end
