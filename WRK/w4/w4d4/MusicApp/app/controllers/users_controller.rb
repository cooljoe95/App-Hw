class UsersController < ApplicationController

  before_action :require_current_user!, except: [:create, :new]

  def index
    if current_user
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  # Came up with class without any resources
  def new
    if current_user
      redirect_to user_url(current_user)
    else
      @user = User.new
      render :new
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      log_in_user!(user)
      redirect_to user_url(user)
    else
      render json: user.errors.full_messages
    end
  end

  def show
    begin
      @user = User.find(params[:id])
      render :show
    rescue
      redirect_to user_url(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
