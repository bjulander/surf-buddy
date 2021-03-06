

class ApplicationController < Sinatra::Base
  
    configure do #allows scoping of settings for certain environments. Yields to block and sends in self
      set :public_folder, 'public' #set accepts 2 arguments of what we are setting "look for styling in public"
      set :views, 'app/views'  #set accepts 2 arguments of what we are setting "This is where you should look for the views folder"
      enable :sessions
      set :session_secret, "locals_only_no_kooks_allowed"
    end

    register Sinatra::Flash
  
    get "/" do
      erb :index
    end
  
    helpers do
      def current_user
        User.find_by(id: session[:user_id])
      end

      def logged_in?
        !!session[:user_id]
      end 
  
      def redirect_if_not_logged_in
        redirect to "/signup" unless current_user
      end

      def owner?(object)
        object.user == current_user
      end

      def find_board
        Board.find_by(id: params[:id])
      end

      def find_leash
        Leash.find_by(id: params[:id])
      end

      def find_break
        Break.find_by(id: params[:id])
      end
    end
end
  