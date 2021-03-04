class BoardsController < ApplicationController

  get '/boards' do
    if session[:user_id]
        redirect to '/boards/index'
    else
        redirect to '/boards/new'
    end 
  end

  get '/boards/index' do
    redirect_if_not_logged_in
    @boards = Board.all
    if @boards.empty?
        redirect to '/boards/new'
      else
        erb :'/boards/index'
    end
  end

  get '/boards/new' do
    redirect_if_not_logged_in
    erb :'/boards/new'
  end

  post '/boards' do
    redirect_if_not_logged_in
    @board = Board.create(params)
    if @board.id
      redirect to "/boards/#{@board.id}"
    else
      redirect to '/boards/new'
    end
  end

  get '/boards/:id' do
    redirect_if_not_logged_in
    @board = find_board
    erb :"/boards/show"
  end

  get '/boards/:id/edit' do
    redirect_if_not_logged_in 
  end

  patch '/boards/:id/edit' do
    redirect_if_not_logged_in
  end

  delete '/boards/:id/delete' do
    redirect_if_not_logged_in 
  end



end