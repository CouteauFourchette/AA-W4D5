class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  before_action :require_login

  def log_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def current_user
    user = User.find_by(session_token: session[:session_token])
    user ? user : nil
  end

  def logged_in?
    !!current_user
  end

  def require_login

    unless logged_in?
      redirect_to new_sessions_url
    end
  end
end
