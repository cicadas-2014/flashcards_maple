get '/'  do
	"Get Started!"
	redirect '/home'
	erb :index
	# 
end

post '/login' do
	user = User.authenticate( params[:email],
                            params[:password] )
  	if user
    	session[:id] = user.id
    	erb :create
  	else
		erb :index
  	end
  end
    redirect '/home'
end

post '/create' do
	redirect '/' 
end

get '/home' do
	@round = Round.all
	erb :choose_deck
	redirect '/pre'
end

get '/pre' do
	redirect '/' unless session[:id]
	@user = User.find(session[:id]) # post /home selects a deck
	@round = Round.new(params[:round])
	# increment up so that one/one so that the round can talk to the deck, and can be rendered at right time.

	@deck = #shuffle deck at begining, increment up for every post request
	# create a new card from the top
	# 
	erb :display_cards
	# display cards
end

post '/post' do 
	if # correct modify file accordingly
	else # if incorrect modify file accordingly
	end
	# either reload ruby or keep request
end

post '/guess' do
	@guess = Guess.new(params[:deck])
	# creates the new guess object for the game
end

delete '/logout' do
	session.clear
	redirect '/'
end

get '/finsh' do
	erb :display_results
	# finish page
	# stats of the game
end

get '/review' do
	# tbd
end

get '/stats' do
	erb :display_user
	# user stats
	# user profile
end