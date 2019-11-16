require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  describe '#index' do
    context 'ログイン済みのユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
      end

      it '正常にレスポンスを返すこと' do
        sign_in @user
        get :index
        expect(response).to be_successful
      end

      it '200レスポンスを返すこと' do
        sign_in @user
        get :index
        expect(response).to have_http_status '200'
      end
    end

    context 'ログインしていないユーザーとして' do
      it '302レスポンスを返すこと' do
        get :index
        expect(response).to have_http_status '302'
      end

      it 'サインイン画面にリダイレクトすること' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#create' do
    context 'ログイン済みのユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
        @riderhouse = FactoryBot.create(:riderhouse)
      end

      it 'お気に入りを追加できること' do
        sign_in @user
        expect {
          post :create, params: { user_id: @user.id, riderhouse_id: @riderhouse.id}
        }.to change(Favorite, :count).by(1)
      end
    end
  end

  describe '#destroy' do
    context 'ログイン済みのユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
        @favorite = FactoryBot.create(:favorite)
      end

      it 'お気に入りを削除できること' do
        sign_in @user
        expect do
          delete :destroy, params: { id: @favorite.id }
        end.to change(Favorite, :count).by(-1)
      end
    end
  end
end
