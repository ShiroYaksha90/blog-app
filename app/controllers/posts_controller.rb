class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = 'Post was successfully created'
      redirect_to user_posts_path(current_user, @post), notice: 'Post was successfully created.'
    else
      render :new
      flash[:notice] = 'Post was not created.'
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author_id
  rescue ActiveRecord::RecordNotFoundError
    redirect_to root_path
  end

  def destroy
    set_post
    @post.comments.destroy_all
    @post.likes.destroy_all
    if @post.destroy
      flash[:notice] = 'Post was deleted successfully.'
      redirect_to user_posts_path
    else
      render 'Error', status: unprocessable_entity
    end
  end

  private

  def set_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
