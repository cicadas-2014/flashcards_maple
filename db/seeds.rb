judy = User.create(email: "judy@dbc.com", password: "judydbc")
danielle = User.create(email: "danielle@dbc.com", password: "danielledbc")
richard = User.create(email: "richard@dbc.com", password: "richarddbc")
jason = User.create(email: "jason@dbc.com", password: "jasondbc")

eng_fr_deck = Deck.create(category: "English - French")

eng_fr_cards = File.open("db/english-french-short.txt").read

eng_fr_cards.each_line do |line|
	card = line.chomp.split("\t")
	Card.create(deck_id: eng_fr_deck.id, term: card[0], definition: card[1])
end


eng_ital_deck = Deck.create(category: "English - Italian")

eng_ital_cards = File.open("db/english-italian-short.txt").read

eng_ital_cards.each_line do |line|
	card = line.chomp.split("\t")
	Card.create(deck_id: eng_ital_deck.id, term: card[0], definition: card[1])
end



eng_sp_deck = Deck.create(category: "English - Spanish")

eng_sp_cards = File.open("db/english-spanish-short.txt").read

eng_sp_cards.each_line do |line|
	card = line.chomp.split("\t")
	Card.create(deck_id: eng_sp_deck.id, term: card[0], definition: card[1])
end