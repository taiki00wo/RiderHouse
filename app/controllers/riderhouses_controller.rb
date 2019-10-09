class RiderhousesController < ApplicationController
  def index
    @riderhouses = Riderhouse.all
  end

  def show
    @riderhouse = Riderhouse.find(params[:id])
  end

  def new
    @riderhouse = Riderhouse.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
