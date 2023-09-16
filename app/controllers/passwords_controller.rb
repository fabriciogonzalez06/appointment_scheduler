class PasswordsController < ApplicationController

    before_action :require_user_logged_in! 

    def edit 
    end 

    def update 
       
        if Current.user.update(password_params)
            redirect_to logout_path, notice: 'Password updated'
        else
            render :edit  
        end 
    end 


    private 
    def password_params
        defaults = { first_login: false }
        params.require(:user).permit(:password, :password_confirmation).reverse_merge(defaults)
    end 
end
