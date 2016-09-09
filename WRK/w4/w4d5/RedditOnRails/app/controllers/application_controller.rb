class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.session_token
    @current_user = user
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def logged_in?
    !!current_user
  end

  def need_to_login
    if !logged_in?
      redirect_to new_session_url
    end
  end

  def redirect_if_logged_in
    if logged_in?
      return_to_where_from
    end
  end

  def return_to_where_from
    begin
      redirect_to URI(request.referer).path
    rescue
      redirect_to subs_url
    end
  end

end
