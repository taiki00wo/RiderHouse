class PostsController < ApplicationController
  def new
    logger.debug('newに入りました')
    @post = Post.new
  end

  def create
    logger.debug('createに入りました')
    @post = Post.new(post_params)
    @post.riderhouse_id = params[:riderhouse_id]
    @post.user_id = current_user.id
    if @post.save!
      flash[:notice] = "口コミを登録しました。"
      redirect_to riderhouses_url
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    logger.degub('updateに入りました')
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:rating, :content)
  end
end
