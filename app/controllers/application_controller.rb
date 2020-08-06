require './config/environment'
require 'rack-flash'


class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    erb :'welcome'
  end

  get "/error" do
    erb :'error'
  end

  get "/general_error" do
    erb :'general_error'
  end

  helpers do
    def logged_in?
			!!current_user
    end

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    def check_login
      if !logged_in?
        redirect to :'/users/login'  
      end
    end

  end
end
