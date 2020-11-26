class ApplicationController < ActionController::Base
    helper_method :current_user, :is_logged_in?

    def flash_message(type, text)
        flash[type] ||= []
        flash[type] << text
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def is_logged_in?
        current_user.present?
    end

    def authenticate
        if !is_logged_in?
            redirect_to login_path
        end
    end
end
