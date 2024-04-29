class MainController < ApplicationController 
    def index
      if session[:user_id]
        @user = User.find_by(id:session[:user_id])  ## find only will throw error if user not found
      end
    end
end