class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def edit

  end

  def show
    begin
      @user = User.find(params[:id])
      render :show
    rescue
      if current_user
        redirect_to user_url(current_user)
      else
        redirect_to new_session_url
      end
    end
  end

  def update

  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
