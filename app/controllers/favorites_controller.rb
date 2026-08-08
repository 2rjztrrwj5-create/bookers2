class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @favorite = Current.user.favorites.find_or_create_by(book: @book)
  end


  def destroy
    @favorite = Current.user.favorites.find(params[:id])
    @favorite.destroy
  end
end
