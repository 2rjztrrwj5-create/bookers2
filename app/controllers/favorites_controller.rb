class FavoritesController < ApplicationController
  def create
    @favorite = Current.user.favorites.build(book_id: params[:book_id])
    @favorite.save
    redirect_to request.referer
  end

  def destroy
    @favorite = Current.user.favorites.find(params[:id])
    @favorite.destroy
    redirect_to request.referer
  end
end
