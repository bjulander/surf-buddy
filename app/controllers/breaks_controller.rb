class BreaksController < ApplicationController

  get "/breaks" do
    if session[:user_id]
      redirect to "/breaks/index"
    else
      redirect to "/breaks/new"
    end 
  end

  get "/breaks/index" do
    redirect_if_not_logged_in
    @user = current_user
    @breaks = Break.all
        erb :"/breaks/index"
  end

  get "/breaks/new" do
    redirect_if_not_logged_in
    @user = current_user
    erb :"/breaks/new"
  end

  post "/breaks" do
    redirect_if_not_logged_in
    @user = current_user
    @break = Break.create(params)
    @break.user = @user
    @break.save
    if @break.id
      redirect to "/breaks/#{@break.id}"
    else
      edirect to "/breaks/new"
    end
  end

  get "/breaks/home" do
    redirect_if_not_logged_in
    @user = current_user
    @user.breaks
    if @user.breaks.empty?
      redirect to "/breaks/new"
    else
      erb :"/breaks/home"
    end
  end

  get "/breaks/:id" do
    redirect_if_not_logged_in
    @break = find_break
    erb :"/breaks/show"
  end

  get "/breaks/:id/edit" do
    redirect_if_not_logged_in
    @break = find_break
    if owner?(@break)
      erb :"/breaks/edit"
    else
      redirect to "/breaks/#{@break.id}"
    end
  end

  patch "/breaks/:id" do
    redirect_if_not_logged_in
    @break = find_break
    if owner?(@break)
      @break.update(params[:break])
    end
    redirect to "/breaks/#{@break.id}"
  end

  delete "/breaks/:id" do
    redirect_if_not_logged_in
    @break = find_break
    if owner?(@break)
      @break.destroy
      redirect to "/breaks"
    else
      redirect to "/breaks"
    end 
  end

end
