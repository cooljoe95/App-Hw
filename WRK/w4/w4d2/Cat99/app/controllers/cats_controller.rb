require 'byebug'
class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cats = [Cat.find(params[:id])]
    render :index
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.age = get_age
    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end

  end

  def new
    @cat = Cat.new
    @cat.birth_date = Date.today
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.age = get_age
    if @cat.update(cat_params)
      redirect_to cat_url(@cat.id)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :age, :name, :sex, :description)
  end

  def get_age
    today = Date.today
    age = today.year - @cat.birth_date.year - 1
    if today.month > @cat.birth_date.month
      age += 1
    elsif today.month == @cat.birth_date.month
      if today.day >= @cat.birth_date.day
        age += 1
      end
    end

    age
  end

end
