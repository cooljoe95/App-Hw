class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    !!current_user
  end

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user
    render json: @current_user
  end

  def logout
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
      @current_user = nil
      render json: {}
    else
      render json: "No one is logged in", status: 404 
    end
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

end
