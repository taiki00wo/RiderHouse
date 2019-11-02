require 'rails_helper'

RSpec.describe RiderhousesController, type: :controller do
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

  describe '#show' do
    context 'ログイン済みのユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
        @riderhouse = FactoryBot.create(:riderhouse, user: @user)
      end

      it '正常にレスポンスを返すこと' do
        sign_in @user
        get :show, params: { id: @riderhouse.id }
        expect(response).to be_successful
      end
    end
  end

  describe '#create' do
    context 'ログイン済みのユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
      end

      it 'ライダーハウスを追加できること' do
        riderhouse_params = FactoryBot.attributes_for(:riderhouse)
        sign_in @user
        expect do
          post :create, params: { riderhouse: riderhouse_params }
        end.to change(Riderhouse, :count).by(1)
      end
    end
  end

  describe '#update' do
    context 'ログイン済みのユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
        @riderhouse = FactoryBot.create(:riderhouse, user: @user)
      end

      it 'ライダーハウスを更新できること' do
        riderhouse_params = FactoryBot.attributes_for(:riderhouse,
                                                      name: 'New Riderhouse Name')
        sign_in @user
        patch :update, params: { id: @riderhouse.id, riderhouse: riderhouse_params }
        expect(@riderhouse.reload.name).to eq 'New Riderhouse Name'
      end
    end
  end

  describe '#destroy' do
    context 'ログイン済みのユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
        @riderhouse = FactoryBot.create(:riderhouse, user: @user)
      end

      it 'ライダーハウスを削除できること' do
        sign_in @user
        expect do
          delete :destroy, params: { id: @riderhouse.id }
        end.to change(Riderhouse, :count).by(-1)
      end
    end
  end
end
