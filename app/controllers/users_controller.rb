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
   @user = User.find(params[:id])
   
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end
end