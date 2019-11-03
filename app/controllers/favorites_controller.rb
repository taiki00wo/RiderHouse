class FavoritesController < ApplicationController
  def index
    @riderhouses = current_user.riderhouses
    @API_KEY_map = ENV['API_KEY_map']
    gon.API_KEY_weather = ENV['API_KEY_weather']
    gon.riderhouses = @riderhouses
    @riderhouses = @riderhouses.page(params[:page]).per(6)
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
