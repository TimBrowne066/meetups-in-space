require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order(:name)
  erb :'meetups/index'
end

get '/meetups/:id' do
  @id = params[:id]
  @meetup = Meetup.find(params[:id])
  @attendees = @meetup.users
  erb :'meetups/show'
end

post '/meetups/:id' do
  attendees = Meetup.find(params[:id]).users
  if current_user
    attendees.each do |attendee|
      if attendee.id == current_user.id
        flash[:notice]= "You've already signed up for this meeting!"
        redirect "/meetups/#{params[:id]}"
        return
      end
    end
    Rsvp.create(meetup: Meetup.find(params[:id]), user: current_user)
    flash[:notice]= "Signup successful!"
    redirect "/meetups/#{params[:id]}"
  else
    flash[:notice]= "you need to be signed in"
    redirect "/meetups/#{params[:id]}"
  end
end

get '/new' do
  if session[:user_id]
    erb :'/new'
  else
    erb :'/error'
  end
end

post '/new' do
  @name = params[:Name]
  @location = params[:Location]
  @description = params[:Description]

@new_meetup =  Meetup.new(name: @name, location: @location, description: @description, creator: current_user.username)
  if @new_meetup.valid?
    flash[:notice] = "Meetup successfully created!!!"
    @new_meetup.save
    redirect "/meetups/#{@new_meetup.id}"
  else
    flash[:notice] = @new_meetup.errors.full_messages
    erb :'/new'
  end
end
