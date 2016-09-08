class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    render :new
  end

  def create
    login_user!
  end

  def destroy
    log_out
    render :new
  end

end
