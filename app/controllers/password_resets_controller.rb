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

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired. Please try again."
    end


    def update 
        @user = User.find_signed!(params[:token], purpose: "password_reset")

        
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was reset"
        
       

        else 
            render :edit , status: 422

        end
    end
        private

        def password_params
            params.require(:user).permit(:password, :password_confirmation)
        end
      
    
end 

    

