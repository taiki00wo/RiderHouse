class FavoritesController < ApplicationController
  def index
  end

  def create
    favorite = current_user.favorites.create(riderhouse_id: params[:riderhouse_id])
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy
  end
end
