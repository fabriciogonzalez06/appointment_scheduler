require 'securerandom'
class UsersController < ApplicationController


  before_action :require_user_logged_in! 
  before_action :clear_generated_password, only: [ :index, :new, :create ]

  $generated_password 

  def index
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
  end 

  def new
 
    @user = User.new
  end 

  def create 

      $generated_password = SecureRandom.hex(14)
      @user = User.new( first_login: true, role: 'admin', email: user_params[:email], password: $generated_password, password_confirmation: $generated_password)

      if @user.save 
        redirect_to @user
      else
        render :new, status: :unprocessable_entity 
      end 
  end
  
  private 
    def user_params 
      params.require(:user).permit(:email)
    end 

    def clear_generated_password 
      $generated_password = nil
    end 
end
