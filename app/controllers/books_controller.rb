class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @books = Book.new
  end

  def index
    @book = Book.all
    @books = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end

  private
  
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
