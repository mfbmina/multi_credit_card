class UsersController < ApplicationController
  before_action :set_user, except: [:index, :create]

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = CreateUser.call(user_params)
    if @user.persisted?
      render :show, status: :created
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def update
    if @user.update_attributes(user_params)
      render :show
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:email, :first_name, :last_name)
  end
end
