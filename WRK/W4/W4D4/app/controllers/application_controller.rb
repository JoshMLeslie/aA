class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  attr_accessor :current_user

  helper_method :current_user, :logged_in?

  def new
    @user = User.new
    render :new
  end

  def login(user)
   session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token! # resets user's DB token to new
    session[:session_token] = nil     # resets user's cookies to nil
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def current_user # find by session_token or return nil if none
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def redir_to(obj)

    byebug
    case obj.class
      when User
        login(user)
        redirect_to user_url(obj.id)
      when Band
        redirect_to band_url(obj.id)
      when Album
        redirect_to album_url(obj.id)
    end
  end







end
