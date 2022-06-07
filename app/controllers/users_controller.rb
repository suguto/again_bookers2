class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def index
    @users = User.all
    @book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = find(params[:id])
    @user.update(user_params)
    redirect user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introdution, :profile_image)
  end
end
