class PasswordResetsController < ApplicationController


    def new
        

    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            #send email

            ##rails has action mailer rails g mailer Password reset

            PasswordMailer.with(user:@user).reset.deliver_now ##background job ### now not good    
            redirect_to root_path, notice:"email with link  sent if account found"       
        else

            redirect_to root_path, notice:"email with link  sent if account found"
        
        end


    end
    


end