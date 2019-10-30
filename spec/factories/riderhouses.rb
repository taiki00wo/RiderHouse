FactoryBot.define do
  factory :riderhouse do
    name { 'テストハウス' }
    address { '東京都品川区南大井' }
    tel { '000-111-2222' }
    price { '3000' }
    opening_hours { '9:00~19:00' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/image.jpg')) }
    association :user
  end
end