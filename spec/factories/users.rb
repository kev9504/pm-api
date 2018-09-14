FactoryBot.define do
  factory :user do
    name { Faker::Internet.name }
    email { Faker::Internet.email}
    password_digest {'somePass1123'}
  end
end
