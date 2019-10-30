FactoryBot.define do
  factory :favorite do
    association :user
    association :riderhouse
  end
end
