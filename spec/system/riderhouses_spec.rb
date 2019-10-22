require 'rails_helper'

describe 'ライダーハウス管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      #ユーザーAを作成しておく
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'user_a@gmail.com')
      #作成者がユーザーAであるライダーハウスを作成しておく
      FactoryBot.create(:riderhouse, name: '最初のライダーハウス', user: user_a)
    end

    context 'ユーザーAがログインしておるとき' do
      before do
        #ユーザーAでログインする
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'user_a@gmail.com' 
        fill_in 'パスワード', with: 'password'
        click_button 'Log in' 
      end

      it 'ユーザーAが作成したライダーハウスが表示される' do
        #作成したライダーハウスの名前が画面上に表示されることを確認
        expect(page).to have_content '最初のライダーハウス'
      end
    end
  end
end