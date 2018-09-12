FactoryBot.define do
  factory :task do
    project_id { rand(0..2)}
    body { "add #{Faker::Measurement.metric_weight} of #{Faker::Science.element}" }
    source { Faker::ProgrammingLanguage.name }
    status { rand(0..2)}
    difficulty { rand(0..10) }
  end
end
