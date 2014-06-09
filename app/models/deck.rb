class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  has_many :users, through: :rounds
  
  validates :category, presence: true
  validates :category, uniqueness: true
end
