class RiderhousesController < ApplicationController
  def index
    if params[:q].present?
      #ソート
      if params[:q][:sorts].present?
        @search = Riderhouse.ransack(params[:q][:sorts])
        # お気に入りの数でソート
        if params[:q] == {"sorts"=>"favorites_count desc"}
          @riderhouses = Riderhouse.find(Favorite.group(:riderhouse_id).order('count(riderhouse_id) desc').pluck(:riderhouse_id))
        # 口コミの数でソート
        elsif params[:q] == {"sorts"=>"posts_count desc"}
          @riderhouses = Riderhouse.find(Post.group(:riderhouse_id).order('count(riderhouse_id) desc').pluck(:riderhouse_id))
        end
        @riderhouses = @search.result 
        @riderhouses = @riderhouses.page(params[:page]).per(8)
      #検索
      elsif params[:q].present?
        @search = Riderhouse.ransack(params[:q])
        @riderhouses = @search.result
        @riderhouses = @riderhouses.page(params[:page]).per(8)
        flash[:notice] = "検索結果は#{@riderhouses.count}件です。"
      end
    #初期表示
    else
      params[:q] = { sorts: 'id desc' }
      @search = Riderhouse.ransack(params[:q])
      @riderhouses = @search.result
      @riderhouses = @riderhouses.page(params[:page]).per(8)
    end
  end

  def index_map
    @riderhouses = Riderhouse.all
    @API_KEY_map = ENV['API_KEY_map']
    gon.API_KEY_weather = ENV['API_KEY_weather']
  end

  def show_map
    gon.riderhouse = Riderhouse.find(params[:id])
    @riderhouse = Riderhouse.find(params[:id])
    @API_KEY_map = ENV['API_KEY_map']
  end

  def show
    @riderhouse = Riderhouse.find(params[:id])
    @posts = @riderhouse.posts
    @post = Post.new
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
