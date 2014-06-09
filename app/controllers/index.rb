get '/'  do
	"Get Started!"
	erb :index
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
end

# POST when user first starts a round
post '/home' do
	@deck = Deck.find(params[:deck][:id])
	session[:deck] = @deck.id

	@correct = nil #the first time entering round, no concept of correctness

	@round = Round.create(user_id: session[:user_id], deck_id: session[:deck])
	session[:round] = @round.id

	@round.create_guesses
	@guess = Round.find(session[:round]).next_guess
	@card = @guess.card
	session[:guess] = @guess.id
	erb :display_cards
end

# POST when user enters a guess
post '/guess' do 
	# determine and update db if user guessed right
	@guess = Guess.find(session[:guess])
	@correct = @guess.card.term.downcase == params[:guess][:answer].chomp.downcase
	@guess.attempts += 1
	@guess.correct_guess = @correct
	@guess.save
	@prev_term = @guess.card.term
	@prev_def = @guess.card.definition

	# get the next card for user
	@guess = Round.find(session[:round]).next_guess

	# if game is over, direct user to finish page
	if @guess.nil?
		redirect '/finish'
	else
		@card = @guess.card
		session[:guess] = @guess.id
		erb :display_cards
	end
end

get '/finish' do
	@user = User.find(session[:user_id])
	@round = Round.find(session[:round])
	@round.update_results
	@best_round = @user.best_round(session[:deck])
	erb :display_results
end

get '/stats' do
	@user = User.find(session[:user_id])
	@best_round = @user.best_round(session[:deck])
	erb :display_user
end

delete '/logout' do
	session.clear
	redirect '/'
end

delete '/home' do
	redirect '/home'
end