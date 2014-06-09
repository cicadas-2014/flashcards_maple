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

  def update_results
    self.num_played = self.guesses.where("attempts > ?", 0).length
    self.num_correct = self.guesses.where(correct_guess: true).length
    self.percent_correct = 1.0 * self.num_correct / self.num_played
    self.save
  end

  def next_guess
    self.guesses.where(attempts: 0).first
  end
end
