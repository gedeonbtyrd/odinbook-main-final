FactoryBot.define do
  factory :post do
    association :user
    content { Faker::Lorem.paragraph }
  end
end
