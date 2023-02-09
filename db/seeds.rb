# frozen_string_literal: false

Comment.delete_all
Like.delete_all
Post.delete_all
FriendRequest.delete_all
Profile.delete_all
User.delete_all

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"

  user = User.create(
    email: Faker::Internet.email(name: name),
    password: 'abc123'
  )

  Profile.create(
    name: name,
    location: "#{Faker::Address.city}, #{Faker::Address.country}",
    birthday: Faker::Date.birthday(min_age: 12, max_age: 90),
    user_id: user.id
  )

  3.times do
    Post.create(
      content: Faker::Lorem.paragraph,
      user_id: user.id
    )
  end
end
