require "./config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'supersecretsession'
  end

  get '/' do
    erb :root, :layout => :layout
  end

  get '/signup' do
    erb :'account/signup', :layout => :layout
  end

  post '/signup' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect to '/'
    else
      redirect to 'signup'
    end
  end
end
