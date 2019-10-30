class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.riderhouse_id = params[:riderhouse_id]
    @post.user_id = current_user.id
    if @post.save!
      flash[:notice] = '口コミを登録しました。'
      redirect_to riderhouses_url
    else 
      render 'new'
    end
  end

  def edit
  end

  def update 
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:rating, :content)
  end
end
