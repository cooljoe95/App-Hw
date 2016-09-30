class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    # byebug
    if @user.save
      login!(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render json: @user.errors.full_messages, status: 422
    end
    # render json: @user
  end

  def user_params
    debugger
    params.require(:user).permit(:username, :password)
  end
end
