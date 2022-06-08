class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = @book.user
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
    if @book.update(book_params)
      flash[:notice] = "successfully update!!!"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
      flash[:notice] = "successfully create!!!"
      redirect_to book_path(@book)
    else
      @book = Book.all
      @books = Book.new
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

end
