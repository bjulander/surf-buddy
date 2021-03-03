class BreaksController < ApplicationController
  get '/breaks' do
    redirect_if_not_logged_in
    @breaks = Break.all
    if @breaks.empty?
        redirect to '/bearks/new'
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
      redirect to '/breaks'
    else
      redirect to '/breaks/new'
    end
  end
end