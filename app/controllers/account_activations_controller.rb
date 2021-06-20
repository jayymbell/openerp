class AccountActivationsController < ApplicationController
  # before_action :authenticate, only: [:new]
  before_action :set_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit]

  def create
    user = User.find_or_create_by(person_id: params[:id])
    if user.present?
      user.create_activation_digest
      user.send_account_activation_email
    end
    
    respond_to do |format|
      flash_message(:success, "Account acctivation message sent")
      format.js {render js:'window.location.reload();'}
    end
  end

  def edit
    if @user.is_active
      @user.create_reset_digest
      redirect_to edit_password_reset_url(@user.reset_token, email: @user.person.email)
    elsif @user && @user.authenticated?(:activation, params[:id])
      @user.update_attribute(:is_active, true)
      @user.update_attribute(:activation_at, Time.zone.now)
      flash_message(:success, "Account acctivated.")
      @user.create_reset_digest
      redirect_to edit_password_reset_url(@user.reset_token, email: @user.person.email)
    else
      flash_message(:alert, "Invalid activation link.")
      redirect_to root_url
    end
  end

private

  def set_user
    @user = Person.find_by(email: params[:email]).user
  end

  def check_expiration
    if @user.account_activiation_expired?
      flash_message(:alert, "Activation link has expired.")
      redirect_to root_path
    end
  end

end
