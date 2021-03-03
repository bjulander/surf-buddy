class LeashesController < ApplicationController
  get '/leashes' do
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
    @Leash = Leash.create(params)
    if @leash.id
      redirect to '/leashes'
    else
      redirect to '/leashes/new'
    end
  end
end