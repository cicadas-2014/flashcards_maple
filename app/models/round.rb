class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  validates :user, :deck, presence: true
  validates :user, :deck, uniqueness: true
end
