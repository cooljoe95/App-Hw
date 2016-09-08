class SessionsController < ApplicationController

  # Needed to peek at previous resources/ Maybe not, writing down the
  #   following helped me have a launch pad for where to go
  # Did need to refresh my memory for the new and destroy, and I checked my create
  # Know this is for loging in.
  # Create represents logging in.
  # Destroy represents logging out.

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      log_in_user!(user)
      redirect_to user_url(user)
    else
      redirect_to new_user_url
    end
  end

  def new
    redirect_to new_user_url
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
