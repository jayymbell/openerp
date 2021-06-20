class SessionsController < ApplicationController
  def new
  end

  def create
    user = Person.find_by_email(params[:session][:email]).present? ? Person.find_by_email(params[:session][:email]).user : nil
    if Person.find_by_email(params[:session][:email]).present? && !user.is_active
      flash_message(:alert, "This account is inactive. Contact support to reactivate.")
      redirect_to root_url
    elsif user && user.password_digest.present? && user.authenticate(params[:session][:password])
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
