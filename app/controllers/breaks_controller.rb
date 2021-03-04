class BreaksController < ApplicationController

  get '/breaks' do
    if session[:user_id]
        redirect to '/breaks/index'
    else
        redirect to '/breaks/new'
    end 
  end

  get '/breaks/index' do
    redirect_if_not_logged_in
    @breaks = Break.all
    if @breaks.empty?
        redirect to '/breaks/new'
      else
        erb :'/breaks/index'
    end
  end

  get '/breaks/new' do
    redirect_if_not_logged_in
    erb :'/breaks/new'
  end

  post '/breaks' do
    redirect_if_not_logged_in
    @break = Break.create(params)
    if @break.id
      redirect to '/breaks/index'
    else
      redirect to '/breaks/new'
    end
  end
end