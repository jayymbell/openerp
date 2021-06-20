class SessionsController < ApplicationController
  def new
    render layout: false
  end

  def create
    user = Person.find_by_email(params[:email]).user
    if !user.is_active
      flash_message(:alert, "This account is inactive. Contact support to reactivate.")
      redirect_to root_url
    elsif user && user.password_digest.present? && user.authenticate(params[:password])
      log_in user
      redirect_to root_url
    else
      flash_message(:alert, "Invalid credentials")
      redirect_to root_url
    end
  end

  def destroy
      log_out current_user
      flash_message(:success, "Logged out sucessfully.")
      redirect_to root_url
  end

  private

    def log_in(user)
      session[:user_id] = user.id
      user.update(last_login_at: DateTime.now)
    end

    def log_out(user)
        session[:user_id] = nil
    end
end
