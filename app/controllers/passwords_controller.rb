class PasswordsController < ApplicationController 

    before_action :require_user_logged_in!
def edit

end

def update
   if Current.user.update(password_params)
    redirect_to root_path, notice: "password updated successfully"
    else
        render :edit , status: 422
   
 end




end

def password_params
    params.require(:user).permit(:password, :password_confirmation)
end

end
