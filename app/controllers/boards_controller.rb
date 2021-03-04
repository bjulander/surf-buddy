class BoardsController < ApplicationController

  get "/boards" do
    if session[:user_id]
        redirect to "/boards/index"
    else
        redirect to "/boards/new"
    end 
  end

  get "/boards/index" do
    redirect_if_not_logged_in
    @user = current_user
    @boards = Board.all
    erb :"/boards/index"
  end

  get "/boards/new" do
    redirect_if_not_logged_in
    @user = current_user
    erb :"/boards/new"
  end

  post "/boards" do
    redirect_if_not_logged_in
    @user = current_user
    @board = Board.create(params)
    @board.user = @user
    @board.save
    if @board.id
      redirect to "/boards/#{@board.id}"
    else
      redirect to "/boards/new"
    end
  end

  get "/boards/home" do
    redirect_if_not_logged_in
    @user = current_user
    @user.boards
    if @user.boards.empty?
        redirect to "/boards/new"
      else
        erb :"/boards/home"
    end
  end

  get "/boards/:id" do
    redirect_if_not_logged_in
    @board = find_board
    erb :"/boards/show"
  end

  get '/boards/:id/edit' do
    redirect_if_not_logged_in
    @board = find_board
    if owner?(@board)
      erb :"/boards/edit"
    else
      redirect to "/boards/#{@board.id}"
    end 
  end

  patch '/boards/:id/edit' do
    redirect_if_not_logged_in
    @board = find_board
    if owner?(@board)
      @board.update
    end      
    redirect to "/boards/#{@board.id}"
  end

  delete '/boards/:id/delete' do
    redirect_if_not_logged_in
    @board = find_board
    if owner?(@board)
      @board.destory
      redirect to "/boards"
    else
      redirect to "/boards"
    end 
  end



end