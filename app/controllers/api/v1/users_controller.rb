class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end
end
