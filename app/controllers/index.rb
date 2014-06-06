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
	@user = User.find(session[:id])
	@round = Round.new(params[:round])
	erb :display_cards
	# display cards
end

post '/post' do 
	if # correct modify file accordingly
	else # if incorrect modify file accordingly
	end
	# either reload ruby or keep request
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