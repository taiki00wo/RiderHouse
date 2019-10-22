FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test1@gmail.com' }
    password { 'password' } 
  end
end