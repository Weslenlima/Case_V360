class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    Rails.logger.info "SESSION ID: #{session[:user_id]}"
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Faça login para continuar."
    end
  end
end
