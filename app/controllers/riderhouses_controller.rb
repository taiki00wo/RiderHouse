class RiderhousesController < ApplicationController
  def index
    if params[:q].present?
      @search = Riderhouse.ransack(params[:q])
      # お気に入りの数でソート
      if params[:q] == {"sorts"=>"favorites_count desc"}
        @riderhouses = Riderhouse.find(Favorite.group(:riderhouse_id).order('count(riderhouse_id) desc').pluck(:riderhouse_id))
      # 口コミの数でソート
      elsif params[:q] == {"sorts"=>"posts_count desc"}
        @riderhouses = Riderhouse.find(Post.group(:riderhouse_id).order('count(riderhouse_id) desc').pluck(:riderhouse_id))
      end
      @riderhouses = @search.result
    else
      params[:q] = { sorts: 'id desc' }
      @search = Riderhouse.ransack(params[:q])
      @riderhouses = Riderhouse.all
    end
    @riderhouses = @riderhouses.page(params[:page]).per(8)
  end

  def index_map
    gon.riderhouses = Riderhouse.all
    # @riderhouses = Riderhouse.all
    @API_KEY_map = ENV['API_KEY_map']
    gon.API_KEY_weather = ENV['API_KEY_weather']
  end

  def show_map
    gon.riderhouse = Riderhouse.find(params[:id])
    @API_KEY_map = ENV['API_KEY_map']
  end

  def show
    @riderhouse = Riderhouse.find(params[:id])
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
