require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーション' do
    before do
      @post = FactoryBot.build(:post)
    end

    it '評価、内容があれば有効であること' do
      expect(@post).to be_valid
    end

    it '評価が無ければ無効であること' do
      @post.rating = nil
      @post.valid?
      expect(@post.errors[:rating]).to include('を入力してください')
    end

    it '内容が無ければ無効であること' do
      @post.content = nil
      @post.valid?
      expect(@post.errors[:content]).to include('を入力してください')
    end
  end

  describe 'メソッドrating_average' do
    before do
      # ライダーハウスを作成
      @riderhouse = FactoryBot.create(:riderhouse)
    end

    context 'ライダーハウスに投稿がある場合' do
      before do
        # 投稿を作成
        post1 = FactoryBot.create(
          :post,
          rating: 2,
          riderhouse: @riderhouse
        )
        post2 = FactoryBot.create(
          :post,
          rating: 5,
          riderhouse: @riderhouse
        )
      end

      it '正しい評価の平均が返ってくること' do
        post = Post.new
        expect(post.rating_average(@riderhouse)).to eq('評価：3.5')
      end
    end

    context 'ライダーハウスに投稿がない場合' do
      it '文字列が返ってくること' do
        post = Post.new
        expect(post.rating_average(@riderhouse)).to eq('評価なし')
      end
    end
  end
end
