class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  has_many :rounds, through: :guesses
  
  validates :term, :definition, presence: true
  validates :term, :definition, uniqueness: true
end
