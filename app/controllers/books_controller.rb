class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
    @User = User.new
  end
  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
     else
        @books = Book.all
        render :index
     end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def index
    @books = Book.all
    @user =  current_user
    @book = Book.new
  end
  def edit
    @book = Book.find(params[:id])
    scream_book(@book)
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

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
         flash[:notice] = "You have updated book successfully."
         redirect_to book_path(@book)
    else
      @books = Book.all
       flash[:notice] = 'error'
       render :edit
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def scream_book(book)
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
end