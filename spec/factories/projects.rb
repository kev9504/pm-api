FactoryBot.define do
  factory :project do
    title { Faker::Space.launch_vehicule }
    budget { rand(100..1000) }
    owner { rand(0..5) }
    contact_name { Faker::Name.name }
    contact_email { Faker::Internet.email }
    contact_phone { (Faker::PhoneNumber.subscriber_number + rand(100..300).to_s).to_i }
    status { rand(0..6) }
    description { Faker::Lorem.paragraph }
  end
end
