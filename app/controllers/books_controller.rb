class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def new
    @User = User.new
  end
  def create
    @book = Book.new(book_params)
   if @book.save
        flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
   elsif
      @books = Book.all
      render "index"
   else  
      @books = Book.all
       flash[:notice] = 'error'
   end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @user = current_user
  end
  def index
    @books = Book.all
    @user =  current_user
    @book = Book.new
  end
  def edit
    @book = Book.find(params[:id])
    @user = current_user
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
    elsif
      render :index
    else  
      @books = Book.all
       flash[:notice] = 'error'
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end