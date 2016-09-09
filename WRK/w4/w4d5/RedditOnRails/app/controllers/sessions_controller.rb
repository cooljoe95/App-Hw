class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, only: [:new]

  def create
    user = User.check_credentials(
        params[:session][:username],
        params[:session][:password]
        )
    if user
      login!(user)
      go_back = params[:session][:backtrace]
      if go_back
        redirect_to go_back
      else
        redirect_to user_url(user)
      end
    else
      render :new
    end
  end

  def new
    begin
      @backtrace = URI(request.referer).path
    rescue
      @backtrace = nil
    end
    render :new
  end

  def destroy
    log_out!
    begin
      redirect_to URI(request.referer).path
    rescue
      redirect_to subs_url
    end
  end

  private
  def session_params
    params.require(:session).permit(:username, :password, :backtrace)
  end

end
