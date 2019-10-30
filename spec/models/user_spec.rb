require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  
  describe 'バリデーション' do
    it "名前、メールアドレス、パスワードがあれば有効であること" do  
      expect(@user).to be_valid
    end

    it "名前が無ければ無効であること" do
      @user.name = nil
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "メールアドレスが無ければ無効であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it "メールアドレスに@が含まれていないと無効であること" do
      @user.email = "test_email"
      @user.valid?
      expect(@user.errors[:email]).to include("は不正な値です")
    end

    it '重複したメールアドレスは無効なこと' do
      @user = FactoryBot.create(:user, email: 'test@gmail.com')
      @user = FactoryBot.build(:user, email: 'test@gmail.com')
      @user.valid?
      expect(@user.errors[:email]).to include('はすでに存在します')
    end

    it "パスワードが無ければ無効であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください")
    end

    it 'パスワードが6文字未満であれば無効であること' do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors[:password]).to include("は6文字以上で入力してください")
    end

    
  end

end