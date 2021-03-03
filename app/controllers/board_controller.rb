class BoardController < ApplicationController
    get '/boards' do
        if logged_in?
          @boards = Board.all
          erb :'boards/index'
        else
          redirect to '/login'
        end
    end
end