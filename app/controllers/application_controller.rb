class ApplicationController < Sinatra::Base
  register Sinatra::Flash

  configure do #allows scoping of settings for certain environments. Yields to block and sends in self
    set :public_folder, 'public' #set accepts 2 arguments of what we are setting "look for styling in public"
    set :views, 'app/views'  #set accepts 2 arguments of what we are setting "This is where you should look for the views folder"
    enable :sessions
    set :session_secret, "locals_only_no_kooks_allowed"
  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
