class HomesController < ApplicationController
  def guest_sign_in
    user = User.find_by(email: 'guest@example.com')
    if user
      sign_in user
      redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
    else
      redirect_to new_user_registration_path, notice: 'お手数ですが、ユーザー登録をお願いいたします。'
    end
  end
end
