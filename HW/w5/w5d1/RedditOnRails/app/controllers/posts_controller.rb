# author_id  :integer          not null
# #  title      :string           not null
# #  url        :string
# #  content    :text
# sub_id     :integer          not null
class PostsController < ApplicationController

  before_action :need_to_login, except: [:show]

  def new
    debugger
    @sub_id = params[:sub_id]
    render :new
  end

  def create
    post = Post.new(post_params)
    post.author = current_user
    if post.save
      redirect_to post_url(post)
    else
      render :new
    end
  end

  def edit

  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def update

  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end

end
