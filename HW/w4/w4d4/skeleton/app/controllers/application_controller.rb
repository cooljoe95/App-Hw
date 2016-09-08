class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def logged_in?
    !!current_user
  end

  def login_user!
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      session[:session_token] = user.reset_session_token!

      redirect_to cats_url
    else
      render :new
    end
  end

  def redirect_if_logged_in
    if logged_in?
      redirect_to cats_url
    end
  end

  def redirect_to_log_in
    unless logged_in?
      redirect_to new_session_url
    end
  end

end
