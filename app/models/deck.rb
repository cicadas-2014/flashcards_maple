class Deck < ActiveRecord::Base
  has_many :cards
  validate :category, presence: true
  validate :category, uniqueness: true
end
