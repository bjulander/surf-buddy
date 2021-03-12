

class UsersController < ApplicationController

    get "/signup" do
        if session[:user_id]
            redirect to "/users/index"
        else
            redirect to "/users/new"
        end 
    end

    post "/signup" do
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        @messages = @user.errors.full_messages
        binding.pry
        if @user.id && @messages.empty?
            session[:user_id] = @user.id
            redirect to "/users/index"
        else
            redirect to "/signup"
        end
    end

    get "/users/index" do
        redirect_if_not_logged_in
        if session[:user_id]
            @user = current_user
            erb :"/users/index"
        else
            redirect to "/signup"
        end
    end

    get "/users/new" do
        flash[:message] = "No kooks allowed!"
        erb :"/users/new"
    end


    get "/login" do 
        if session[:user_id]
            redirect to "/users/index"
        else
            redirect to "/"
        end
    end

    post "/login" do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/users/index"
        else
            redirect to "/signup"
        end
    end

    get "/users/home" do
        redirect_if_not_logged_in
        @user = current_user
        erb :"/users/home"
    end

    get "/logout" do 
        session.clear
        redirect "/"
    end
    
end