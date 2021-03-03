class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/new', locals: {message: "No kooks allowed!"}
    else
      erb :'/show'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/users3/signup'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      erb :'/show'
    end
  end

  get '/login' do
    # if session[:user_id]
     if !logged_in?
      erb :'/users/home'
    else
      redirect to '/users2/signup'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/users1/show'
    else
      redirect to '/users1/signup'
    end
  end

  get '/logout' do
      session.clear
      redirect to '/'
  end

end