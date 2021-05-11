class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def new
    @User = User.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  #   respond_to do |format|
  #   format.html { redirect_to books_url, notice: 'Book was successfully destroyed.'}
  #           format.html{redirect_to books_path, notice: "Book was successfully destroyed."}
  #           format.html{render :book}
  # end
   redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end