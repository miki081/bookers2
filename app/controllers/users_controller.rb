class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :scream_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    # @current_user = current_user
    @book = Book.new
    @books = @user.books
  end
  def create
  end
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
  if@user.update(user_params)
         redirect_to user_path(@user), notice: "You have updated user successfully."
  else
    render :edit
  end
  end
   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def scream_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end
end