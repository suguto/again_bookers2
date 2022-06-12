class SearchesController < ApplicationController
  def serach
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      @word = params[:word]
    elsif @range == "Book"
      @books = Book.looks(params[:search], params[:word])
      @word = params[:word]

    end
  end
end
