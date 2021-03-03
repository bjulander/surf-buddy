class BoardsController < ApplicationController
  get '/boards' do
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
    binding.pry
    @board = Board.create(params)
    if @board.id
      redirect to '/boards'
    else
      redirect to '/boards/new'
    end
  end


end