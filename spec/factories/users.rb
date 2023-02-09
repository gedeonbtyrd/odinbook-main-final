FactoryBot.define do
  factory :user do
    email { 'jane_smith@test.com' }
    password { 'abc123' }

    after(:create) do |user|
      create(:post, user: user)
      create(:profile, user: user)
    end

    factory :user_two do
      email { 'john_smith@test.com' }
      password { 'abc123' }
    end

    factory :user_three do
      email { 'william_doe@test.com' }
      password { 'abc123' }
    end
  end
end
