require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  describe '#guest_sign_in' do
    context 'ゲストユーザーが存在する場合' do
      before do
        @user = FactoryBot.create(:user, email: 'guest@example.com')
      end

      it 'ゲストユーザーとしてログインする事' do
        post :guest_sign_in
        expect(response).to redirect_to root_path
      end
    end

    context 'ゲストユーザーが存在しない場合' do
      it 'ユーザー登録にリダイレクトする事' do
        post :guest_sign_in
        expect(response).to redirect_to '/users/sign_up'
      end
    end
  end
end

