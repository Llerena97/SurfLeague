class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @users = User.where(role: "judge")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    if @user = User.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :role
      )
  end
end
