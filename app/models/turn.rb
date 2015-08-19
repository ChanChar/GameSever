class Turn < ActiveRecord::Base
  validates :play_token_id, :directions, presence: true
  belongs_to :play_token
end
