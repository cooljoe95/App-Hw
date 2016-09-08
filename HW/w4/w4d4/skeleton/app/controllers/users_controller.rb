class UsersController < ApplicationController

  before_action :redirect_if_logged_in

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.email = "test@email.com"
    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver
      login_user!
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
