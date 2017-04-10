require "./config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'supersecretsession'
  end

  helpers do
    def logged_in?
      !!current_user
    end
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
     end
  end

  get '/' do
    if current_user
      redirect to '/tasks'
    else
      erb :root, :layout => :home_layout, :locals => { :pageid => "home" }
    end
  end

  not_found do
    status 404
    erb :'errors/404'
  end
end
