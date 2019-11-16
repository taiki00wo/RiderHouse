require 'rails_helper'

RSpec.describe Riderhouse, type: :model do
  before do
    @riderhouse = FactoryBot.create(:riderhouse)
  end

  describe 'validation' do
    it '名前あれば有効であること' do
      expect(@riderhouse).to be_valid
    end

    it '名前が無ければ無効であること' do
      @riderhouse.name = nil
      @riderhouse.valid?
      expect(@riderhouse.errors[:name]).to include('を入力してください')
    end

    # it '住所が無ければ無効であること' do
    #   @riderhouse.address = nil
    #   @riderhouse.valid?
    #   expect(@riderhouse.errors[:address]).to include('を入力してください')
    # end

    # it '電話番号が無ければ無効であること' do
    #   @riderhouse.tel = nil
    #   @riderhouse.valid?
    #   expect(@riderhouse.errors[:tel]).to include('を入力してください')
    # end
  end
end
