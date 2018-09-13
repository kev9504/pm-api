FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { "foo@bar.com" }
    password_digest { "password123@" }
  end
end
