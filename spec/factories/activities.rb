FactoryBot.define do
  factory :activity do
    comment { "MyText" }
    time_spent { 1 }
    user { nil }
    project { nil }
  end
end
