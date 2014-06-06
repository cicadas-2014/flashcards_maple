class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  validate :user, :deck, presence: true
  validate :user, :deck, uniqueness: true
end
