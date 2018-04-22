class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user #returns boolean for current_user presence
  end

  def logout
    current_user.reset_session_token! # logs current_user out / switches session on client-side
    session[:session_token] = nil # sets current_user-side cookies to 'nil'
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_user!
    redirect_to new_session_url if current_user.nil?
  end

  def play_with_cats?
    redirect_to cats_url if current_user
  end

end
