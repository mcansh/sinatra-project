class UserController < ApplicationController
  get '/signup' do
    erb :'account/signup', :layout => :layout
  end

  post '/signup' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect to '/'
    else
      erb :'account/signup', :layout => :layout
    end
  end

  get '/signin' do
    if !logged_in?
      erb :'account/signin', :layout => :layout
    else
      redirect to '/tasks'
    end
  end

  post '/signin' do
    user = User.find_by_username(params[:username]) || User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/'
    else
      erb :'account/signin', :layout => :layout
    end
  end

  get '/logout' do
    session.destroy
    redirect to '/'
  end
end
