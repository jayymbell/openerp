class PasswordResetsController < ApplicationController
  before_action :set_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = Person.find_by(email: params[:password_reset][:email]).user
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash_message(:success, "Email sent with password reset instructions.")
      redirect_to root_url
    else
      flash_message(:alert, "Email address not found.")
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?          
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)        
      flash_message(:success, "Password has been reset.")
      redirect_to root_path
    else
      render 'edit'                             
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def set_user

      @user = Person.find_by(email: params[:email]).user
    end

    # Confirms a valid user.
    def valid_user
      unless (@user && @user.is_active? && @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:alert] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end

end