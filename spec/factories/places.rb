FactoryBot.define do
  factory :place do
    association :user
    association :restaurant
  end
end
