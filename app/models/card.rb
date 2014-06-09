class Card < ActiveRecord::Base
  belongs_to :deck
  validates :term, :defenition, presence: true
  validates :term, :defenition, uniqueness: true
end
