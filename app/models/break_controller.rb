class BreakController < ApplicationController
    get '/breaks' do
        if logged_in?
          @breaks = Break.all
          erb :'breaks/index'
        else
          redirect to '/login'
        end
    end
end