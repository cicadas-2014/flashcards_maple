class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :cards, through: :guesses

  validates :user, :deck, presence: true

  def create_guesses
    deck = self.deck
  	cards = deck.cards.shuffle
  	cards.each do |card|
  		Guess.create(round_id: self.id, card_id: card.id)
  	end
  end
end
