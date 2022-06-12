class BooksController < ApplicationController
  before_action : correct_user, only: [:edit]
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.new
    @comment = BookComment.new
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
    if @book.update(book_params)
      flash[:notice] = "successfully update!!!"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    if  @books.save
      flash[:notice] = "successfully create!!!"
      redirect_to book_path(@books)
    else
      @book = Book.all
      render 'index'
    end
  end

  def destroy
    @book = Book.find(params[:id])
      @book.destroy
      flash[:notice] = "successfully ★Destroy★"
      redirect_to books_path
  end

  private


  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    redirect_to books_path unless @book.user == current_user
  end

end
