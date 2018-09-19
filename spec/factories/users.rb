FactoryBot.define do
  factory :user do
    name { Faker::Internet.name }
    email { Faker::Internet.email}
    password_digest {'secret'}
  end
end
