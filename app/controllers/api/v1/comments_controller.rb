class Api::V1::CommentsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    return unless @comments

    render json: @comments
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments.new(comment_params)
    @comments.post_id = @post.id
    @comments.author_id = @user.id
    if @comments.save
      render json: @comments
    else
      render json: @comments.errors
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to comment_url(@comment), notice: 'Comment was successfully updated.'
      render :show, status: :ok, location: @comment
    else
      render :edit
      render json: @comment.errors
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :created_at, :updated_at)
  end
end
