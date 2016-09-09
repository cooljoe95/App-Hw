class SubsController < ApplicationController

  def index
    render :index
  end

  before_action :moderate_to_edit, only: [:edit, :update]
  before_action :need_to_login, except: [:show, :index]

  def create
    sub = Sub.new(sub_params)
    sub.moderator = current_user
    if sub.save
      redirect_to sub_url(sub)
    else
      flash.now[:errors] = sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def new
    render :new
  end

  def edit

  end

  def show
    begin
      @sub = Sub.find(params[:id])
      render :show
    rescue
      render :index
    end
  end

  def update

  end

  private
  def moderate_to_edit
    begin
      sub = Sub.find(params[:id])
      if current_user != sub.moderator
        redirect_to sub_url(sub)
      end
    rescue
      render :index
    end
  end

  def sub_params
    params.require(:sub).permit(:description, :title)
  end

end
