get '/'  do
	"Get Started!"
	redirect '/home'
	erb :index
	# 
end

get '/home' do
	erb :choose_deck
	redirect '/pre'
end

get '/pre' do
	erb :display_cards
	# display cards
end

post '/post' do 
	if # correct modify file accordingly
	else # if incorrect modify file accordingly
	end
	# either reload ruby or keep request
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