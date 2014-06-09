get '/'  do
	"Get Started!"
	# redirect '/home'
	erb :index
	# 
end

post '/login' do
	@user = User.authenticate(params[:password])
  if @user.nil?
    redirect '/'
  else
    session[:user_id] = @user.id
    redirect '/home'
  end
end

post '/create' do 
	@user = User.create(params[:email], params[:password])
	session[:user_id] = @user.id
    redirect '/home'
end

get '/home' do
	@decks = Deck.all
	erb :choose_deck
	# redirect '/pre'
end

post '/home' do
	@deck = Deck.find(params[:id])
	session[:deck] = @deck.id
	redirect "/game"
end

get '/game/' do
	@cards = Card.where(deck_id: session[:deck])
	@cards.shuffle!
	@card = @cards[0]
	@round = Round.create(params[:user], params[:deck])
	session[:round] = @round.id
	erb :display_cards
end

post '/game' do 
	@guess = Guess.create(params[:guess])
	erb :display_cards
end

get '/finish' do
	@user = User.find(session[:user_id])
	@round = Round.find(session[:round])
	erb :display_results
	# finish page
	# stats of the game
end

get '/stats' do
	@user = User.find(session[:user_id])
	erb :display_user
end

delete '/logout' do
	session.clear
	redirect '/'
end

delete '/home' do
	session[:round].clear
	redirect '/home'
end