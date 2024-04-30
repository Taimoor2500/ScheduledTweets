class ApplicationController < ActionController::Base
    before_action :set_current_user ###before anything happpens
    
    def  set_current_user
     if session[:user_id]
          Current.user = User.find_by(id:session[:user_id])  ## find only will throw error if user not found
      end
    end

    def require_user_logged_in!
    redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil?
    end





end
