class SessionsController < ApplicationController
    def new 
    end 

    def create 
        user = User.find_by_email(params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success]= "Logged In"
            redirect_to root_url
        else 
            flash[:alert] = "Email or password is invalid"
            redirect_to log_in_path
        end  

    end 

    def destroy
        session[:user_id] = nil 
        flash[:notice] = "Logged out"
        redirect_to root_url
    end 
end
