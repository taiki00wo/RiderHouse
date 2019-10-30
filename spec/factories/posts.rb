FactoryBot.define do
  factory :post do
    rating { 3 }
    content { 'とても良い' }
    association :user
    association :riderhouse
  end
end
