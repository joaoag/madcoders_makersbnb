ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require './config/data_mapper'
require 'pry'

class MakersBnb < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end

  get '/profile' do
    if signed_in?
      @venues = current_user.venues
      erb :profile
    else
      redirect 'signin'
    end
  end

  post '/profile' do
    listing = Listing.create(start_date: params[:start_date], end_date: params[:end_date])

    venue = Venue.create(name: params[:name], address: params[:address], ppn: params[:ppn], description: params[:description], user: current_user, listing: listing)

    redirect '/profile'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/'
    end
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/'
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect '/'
  end

  get '/list' do
    erb :list
  end

  get '/book' do
    erb :book
  end

  post '/book/results' do
    listing = Listing.create(start_date: params[:start_date], end_date: params[:end_date])
    session[:listing] = listing.id
    redirect '/book/results'
  end

  get '/book/results' do
    listing_id = session[:listing]
    listing = Listing.get!(listing_id)
    @results = listing.venues
    binding.pry
    erb :book_results
  end




  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end
