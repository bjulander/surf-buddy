class LeashesController < ApplicationController

  get "/leashes" do
    if session[:user_id]
        redirect to "/leashes/index"
    else
        redirect to "/leashes/new"
    end 
  end

  get "/leashes/index" do
    redirect_if_not_logged_in
    @user = current_user
    @leashes = Leash.all
    erb :"/leashes/index"
  end

  get "/leashes/new" do
    redirect_if_not_logged_in
    @user = current_user
    erb :"/leashes/new"
  end

  post "/leashes" do
    redirect_if_not_logged_in
    @user = current_user
    @leash = Leash.create(params)
    @leash.user = @user
    @leash.save
    if @leash.id
      redirect to "/leashes/#{@leash.id}"
    else
      redirect to "/leashes/new"
    end
  end

  get "/leashes/home" do
    redirect_if_not_logged_in
    @user = current_user
    @user.leashes
    if @user.leashes.empty?
      redirect to "/leashes/new"
    else
      erb :"/leashes/home"
    end
  end

  get "/leashes/:id" do
    redirect_if_not_logged_in
    @leash = find_leash
    erb :"/leashes/show"
  end

  get "/leashes/:id/edit" do
    redirect_if_not_logged_in
    @leash = find_leash
    if owner?(@leash)
      erb :"/leashes/edit"
    else
      redirect to "/leashes/#{@leash.id}"
    end
     
  end

  patch "/leashes/:id" do
    redirect_if_not_logged_in
    @leash = find_leash
    if owner?(@leash)
      @leash.update(params[:leash])
    end
    redirect to "/leashes/#{@leash.id}"
  end

  delete "/leashes/:id" do
    redirect_if_not_logged_in
    @leash = find_leash
    if owner?(@leash)
      @leash.destroy
      redirect to "/leashes"
    else
      redirect to "/leashes"
    end  
  end

end