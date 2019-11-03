class HomesController < ApplicationController
  def guest_sign_in
    user = User.find_by(email: 'guest@example.com')
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
