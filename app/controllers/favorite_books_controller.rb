class FavoriteBooksController < ApplicationController
  before_action :set_book
  
  def create
    if Favorite.create(favorited: @book, user: current_user)
      flash[:notice] = 'Book has been favorited'
      redirect_to books_path
    else
      redirect_to @book, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @book.id, user_id: current_user.id).first.destroy
    redirect_to user_path(current_user), notice: 'Book is no longer in favorites'
  end
  
  private
  
  def set_book
    if params[:book_id]
      @book = Book.find(params[:book_id]) 
    else
      @book = Book.find(params[:id])
    end
  end
end
