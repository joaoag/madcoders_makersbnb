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
    venue = Venue.create(name: params[:name], address: params[:address], ppn: params[:ppn], description: params[:description], user: current_user)
    availability = Availability.create(start_date: params[:start_date], end_date: params[:end_date], venue: venue)
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
    if params[:start_date].nil?
      @venues = Venue.all
    else
      @venues = Venue.all(availabilities: { :start_date.gte => params[:start_date], :end_date.lte => params[:end_date] })
    end
    erb :book
  end

  get '/book/request' do
    erb :request
  end

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end
