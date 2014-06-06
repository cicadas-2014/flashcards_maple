judy = User.create(email: "judy@dbc.com", password: "judydbc")
danielle = User.create(email: "danielle@dbc.com", password: "danielledbc")
richard = User.create(email: "richard@dbc.com", password: "richarddbc")
jason = User.create(email: "jason@dbc.com", password: "jasondbc")

eng_fr_deck = Deck.create(category: "English to French")

eng_fr_cards = File.open("db/english-french.txt").read

eng_fr_cards.each_line do |line|
	card = line.chomp.split("\t")
	Card.create(deck_id: eng_fr_deck.id, term: card[0], definition: card[1])
end