class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def show   
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: "Hellz yeah, Henry! Your article was successfully saved!"
    else
      render 'new', notice: 'Oh no, Henry! I was unable to save your post.'
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Your article was successfuly saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end

