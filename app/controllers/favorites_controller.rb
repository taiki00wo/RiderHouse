class FavoritesController < ApplicationController
  def index
    @riderhouses = current_user.riderhouses
    @riderhouses = @riderhouses.page(params[:page]).per(8)
  end

  def create
    favorite = Favorite.create(user_id: current_user.id, riderhouse_id: params[:riderhouse_id])
    @riderhouse = Riderhouse.find(params[:riderhouse_id])
  end

  def destroy
    favorite = Favorite.find(params[:id])
    @riderhouse = Riderhouse.find_by(id: favorite.riderhouse_id)
    favorite.destroy
  end
end
