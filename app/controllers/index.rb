get '/'  do
	"Get Started!"
	# redirect '/home'
	erb :index
	# 
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user.nil? || !@user.authenticate(params[:user][:password])
    redirect '/'
  else
    session[:user_id] = @user.id
    redirect '/home'
  end
end

post '/create' do 
	@user = User.create(params[:user])
	session[:user_id] = @user.id
    redirect '/home'
end

get '/home' do
	@decks = Deck.all
	erb :choose_deck
	# redirect '/pre'
end

post '/home' do
	@deck = Deck.find(params[:deck][:id])
	session[:deck] = @deck.id
	redirect "/game"
end

get '/game' do
	@deck = Deck.find(session[:deck])
	@cards = @deck.cards.shuffle
	@card = @cards[0]
	@round = Round.create(user_id: params[:user], deck_id: params[:deck])
	session[:round] = @round.id
	erb :display_cards
end

post '/guess' do 
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