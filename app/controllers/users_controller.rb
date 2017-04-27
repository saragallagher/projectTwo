class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]= "Account has been created"
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success]= "Account has been updated"

      redirect_to user_path
    else
      redirect_to edit_user_path
    end
  end

  def following
    @user = User.find(params[:id])
    @users = User.all
  end
  def follower
    @user = User.find(params[:id])
    @users = User.all
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name, :user_name, :email, :bio, :password)
  end
end
