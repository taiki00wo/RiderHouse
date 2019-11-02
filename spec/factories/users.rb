FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password { 'password' }
  end
end
