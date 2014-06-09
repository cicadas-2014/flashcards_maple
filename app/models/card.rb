class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  has_many :rounds, through: :guesses
  
  validates :term, :defenition, presence: true
  validates :term, :defenition, uniqueness: true
end
