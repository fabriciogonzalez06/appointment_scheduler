class SessionsController < ApplicationController
    def new 
    end 

    def create 
        user = User.find_by_email(params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            if user.first_login? 
                redirect_to edit_password_path
            else 
                flash[:success]= "Logged In"
                redirect_to root_path
            end 
            
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
