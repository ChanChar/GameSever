require 'rails_helper'

RSpec.describe User, type: :model do

  let(:invalid_user) { User.new(:username => "Charlie-Dash") }
  let(:valid_user) { User.new(:username => "CharlieNoDash") }

  it "validates presence of username" do
    expect(valid_user).to be_valid
  end

  it "validates that there are no invalid characters in username" do
    expect(invalid_user).not_to be_valid
    expect(valid_user).to be_valid
  end
end
