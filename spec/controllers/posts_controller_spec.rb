require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#create" do
    context "ログイン済みのユーザーとして" do
      before do
        @user = FactoryBot.create(:user)
        @riderhouse = FactoryBot.create(:riderhouse)
      end

      it '口コミを追加できること' do
        post_params = FactoryBot.attributes_for(:post)
        sign_in @user
        expect { 
          post :create, params: { riderhouse_id: @riderhouse.id, post: post_params }
        }.to change(Post, :count).by(1)
      end
    end 
  end
end
