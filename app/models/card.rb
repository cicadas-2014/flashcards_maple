class Card < ActiveRecord::Base
  belongs_to :deck
  validate :term, :defenition, presence: true
  validate :term, :defenition, uniqueness: true
end
