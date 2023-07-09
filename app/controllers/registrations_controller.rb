class RegistrationsController < ApplicationController

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        
        if @user.save 
            session[:user_id] = @user.id
            flash[:success] = "Sucessfully created account"
            redirect_to root_path
        else  
            flash[:error] = 'Can not create user!'
            redirect_to sign_up_path
        end 
    end 


    private 

    def user_params 
        params.require(:user).permit(:email, :password, :password_confirmation)
    end 

end
