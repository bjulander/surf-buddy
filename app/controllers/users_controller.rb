class UsersController < ApplicationController

    get '/signup' do
        if session[:user_id]
            redirect to '/users/home'
        else
            redirect to '/users/new'
        end 
    end

    post '/signup' do
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        binding.pry
        @messages = @user.errors.full_messages
        if @user.id && @messages.empty?
            session[:user_id] = @user.id
            redirect to '/users/home'
        else
            redirect to '/signup'
        end
    end

    get '/users/home' do
        redirect_if_not_logged_in
        if session[:user_id]
            @user = current_user
            erb :'/users/home'
        else
            redirect to "/signup"
        end
    end

    get '/users/new' do
        erb :'/users/new'
    end


    get '/login' do 
        if session[:user_id]
            redirect to "/users/home"
        else
            redirect to "/signup"
        end
    end

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to '/users/home'
        else
            redirect to '/signup'
        end
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end
end