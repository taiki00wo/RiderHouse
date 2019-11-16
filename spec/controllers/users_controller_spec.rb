require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#show' do
    context 'ログイン済みのユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
      end

      it '正常にレスポンスを返すこと' do
        sign_in @user
        get :show, params: { id: @user.id }
        expect(response).to be_successful
      end
    end
  end

  describe '#update' do
    context 'ログイン済みのユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
      end

      it 'ユーザーを更新できること' do
        sign_in @user
        user_params = FactoryBot.attributes_for(:user,
          name: 'New User Name')
        patch :update, params: { id: @user.id, user: user_params }
        expect(@user.reload.name).to eq 'New User Name'
      end
    end
  end
end
