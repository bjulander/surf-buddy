class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
          erb :'users/create_user', locals: {message: "No kooks allowed!"}
        else
          redirect to '/surf_spots'
        end
      end

      post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
          redirect to '/signup'
        else
          @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
          @user.save
          session[:user_id] = @user.id
          redirect to '/surf_spots'
        end
      end
end