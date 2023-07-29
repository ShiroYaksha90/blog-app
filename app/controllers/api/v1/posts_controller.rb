class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    render json: @posts
  end

  def show
    @post = Post.includes(:author).find_by(author_id: params[:user_id], id: params[:id])
    render json: @post
  end
end