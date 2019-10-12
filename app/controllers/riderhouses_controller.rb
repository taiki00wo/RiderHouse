class RiderhousesController < ApplicationController
  def index
    @riderhouses = Riderhouse.all
  end

  def show
    @riderhouse = Riderhouse.find(params[:id])
  end

  def new
    # logger.debug ("newに入りました")
    @riderhouse = Riderhouse.new
  end

  def create
    # logger.debug ("createに入りました")
    @riderhouse = Riderhouse.new(riderhouse_params)
    if @riderhouse.save
      flash[:notice] = "ライダーハウス：#{@riderhouse.name}を登録しました。"
      redirect_to @riderhouse
    else 
      render 'new'
    end
  end

  def edit
    @riderhouse = Riderhouse.find(params[:id])
  end

  def update
    @riderhouse = Riderhouse.find(params[:id])
    if @riderhouse.update(riderhouse_params)
      flash[:notice] = "ライダーハウス：#{@riderhouse.name}を更新しました。"
      redirect_to @riderhouse
    else 
      render 'edit'
    end
  end

  def destroy
    @riderhouse = Riderhouse.find(params[:id])
    if @riderhouse.destroy
      flash[:notice] = "ライダーハウス：#{@riderhouse.name}を削除しました。"
      redirect_to riderhouses_url
    else 
      render 'edit'
    end
  end

  private

  def riderhouse_params
    params.require(:riderhouse).permit(:name, :address, :tel, :price, :opening_hours, :image)
  end
end
