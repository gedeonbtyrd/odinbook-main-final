FactoryBot.define do
  factory :profile do
    association :user
    name { 'Jane Smith' }
    location { 'New York City, USA' }
    birthday { '1990-12-12' }
  end
end
