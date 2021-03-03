class LeashesController < ApplicationController
    get '/leashes' do
        if !logged_in?
          @leashes = Leash.all
          erb :'/leashes/index'
        else
          redirect to '/login'
        end
    end
end