class Game < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :play_tokens
end
