class RiderhousesController < ApplicationController
  def index
    @riderhouses = Riderhouse.all
    gon.riderhouses = @riderhouses
    gon.API_KEY = ENV['API_KEY']
    @riderhouses = Riderhouse.page(params[:page]).per(6)
  end

  def show
    @riderhouse = Riderhouse.find(params[:id])
    gon.riderhouse = @riderhouse
    @posts = @riderhouse.posts
  end

  def new
    @riderhouse = Riderhouse.new
  end

  def create
    @riderhouse = Riderhouse.new(riderhouse_params)
    @riderhouse.user_id = current_user.id
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
