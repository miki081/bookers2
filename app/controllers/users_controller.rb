class UsersController < ApplicationController
  def new
    @book = Book.find(params[:id])
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @book = Book.new
    @books = Book.where(user_id:@user.id)

  end
  def index
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
         redirect_to user_path(@user)
  end
  
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end