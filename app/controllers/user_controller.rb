class UserController < ApplicationController


  get '/users/signup' do 
    erb :'/users/signup'
  end

  post '/users/signup' do 
    @user = User.create(
    username: params[:username],
    password: params[:password]
       )
    session[:user_id] = @user.id
     if @user.save
       erb :"/users/show"
     else
       redirect to :"/error"
     end
  end 


  get '/users/login' do
    if logged_in? 
       redirect to :"/playlists"
    else
       erb :"/users/login"
    end
  end
  

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       @session = session
       erb :"/users/show"
    else
      flash[:message] = "Spaces left blank!!"
      erb :"users/login"  
    end
  end


  get '/users/logout' do
    session.clear
    redirect to "/users/login"
  end

  get '/users/:id' do
    check_login
    @user = User.find_by_id(session[:user_id])
    erb :"/users/show"
  end

  
end