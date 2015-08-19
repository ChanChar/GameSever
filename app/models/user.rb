class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_many :play_tokens
  has_many :games, through: :play_tokens
end
