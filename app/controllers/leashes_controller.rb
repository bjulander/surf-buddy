class LeashesController < ApplicationController

  get '/leashes' do
    if session[:user_id]
        redirect to '/leashes/index'
    else
        redirect to '/leashes/new'
    end 
  end

  get '/leashes/index' do
    redirect_if_not_logged_in
    @leashes = Leash.all
    if @leashes.empty?
        redirect to '/leashes/new'
      else
        erb :'/leashes/index'
    end
  end

  get '/leashes/new' do
    redirect_if_not_logged_in
    erb :'/leashes/new'
  end

  post '/leashes' do
    redirect_if_not_logged_in
    @leash = Leash.create(params)
    if @leash.id
      redirect to "/leashes/#{@leash.id}"
    else
      redirect to "/leashes/new"
    end
  end

  get '/leashes/:id' do
    redirect_if_not_logged_in
    @leash = find_leash
    erb :"/leashes/show"
  end

  get '/leashes/:id/edit' do
    redirect_if_not_logged_in 
  end

  patch '/leashes/:id/edit' do
    redirect_if_not_logged_in
  end

  delete '/leashes/:id/delete' do
    redirect_if_not_logged_in 
  end
end