class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post was successfully created.'
    else
      render :new, alert: 'Post was not created.'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
