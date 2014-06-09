class Deck < ActiveRecord::Base
  has_many :cards
  validates :category, presence: true
  validates :category, uniqueness: true
end
