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

	@correct = nil #the first time entering round, no concept of correctness

	@round = Round.create(user_id: session[:user_id], deck_id: session[:deck])
	session[:round] = @round.id

	@round.create_guesses
	@guess = Guess.where(round_id: session[:round].to_s, attempts: 0).first
	@card = @guess.card
	session[:guess] = @guess.id
	erb :display_cards
end

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
	@guess = Guess.where(round_id: session[:round].to_s, attempts: 0).first

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
	@best_round = Round.where(user_id: @user.id).where.not(percent_correct: nil).order(percent_correct: :desc).first
	erb :display_results
	# finish page
	# stats of the game
end

get '/stats' do
	@user = User.find(session[:user_id])
	@best_round = Round.where(user_id: @user.id).where.not(percent_correct: nil).order(percent_correct: :desc).first	
	erb :display_user
end

delete '/logout' do
	session.clear
	redirect '/'
end

delete '/home' do
	redirect '/home'
end