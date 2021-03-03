class UserController < ApplicationController

  get '/signup' do
    if session[:user_id]
      redirect "/users/home"
    end
      erb :"/users/new"
  end

  post '/signup' do 
    @user = User.create(username: params[:username], password: params[:password])
    @messages = @user.errors.full_messages
    if @user.id && @messages.empty?
        session[:user_id] = @user.id
        redirect to "/users/home"
    else 
        erb :"users/new"
    end
  end

  get "/login" do
    if session[:user_id]
        erb :"/user/home"
    else
      redirect "/signup"
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/home"
    else 
      redirect "/signup"
    end
  end

  get "/users/home" do
    redirect_if_not_logged_in

    if session[:user_id]
        @user = current_user
        erb :"/users/home"
    else 
        redirect to "/login"
    end 
  end

  get '/logout' do 
    session.clear
    redirect '/'
  end



  # get '/signup' do
  #   if !logged_in?
  #     erb :'users/new', locals: {message: "No kooks allowed!"}
  #   else
  #     erb :'/home'
  #   end
  # end

  # post '/signup' do
  #   if params[:username] == "" || params[:email] == "" || params[:password] == ""
  #     redirect to '/users3/signup'
  #   else
  #     @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
  #     session[:user_id] = @user.id
  #     erb :'/home'
  #   end
  # end

  # get '/login' do
  #   # if session[:user_id]
  #    if !logged_in?
  #     erb :'/users/home'
  #   else
  #     redirect to '/users2/signup'
  #   end
  # end

  # post '/login' do
  #   @user = User.find_by(:username => params[:username])
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect to '/users1/show'
  #   else
  #     redirect to '/users1/signup'
  #   end
  # end

  # get '/logout' do
  #     session.clear
  #     redirect to '/'
  # end

end