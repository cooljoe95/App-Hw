class Api::TodosController < ApplicationController

  def show
    render json: Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: Todo.all
  end

  def update
    todo = Todo.find(params[:id])
    todo.update!(todo_params)
    render json: todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def index
    render json: Todo.all
  end

  private
  def todo_params
    params.require(:todo).permit(:done, :body, :title)
  end
end
