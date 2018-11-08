@user = User.create!(
    name: 'test user', 
    email: 'test@redcarats.com',
    password: 'secret');
10.times do 
    @project = @user.projects.create!(
    :title => Faker::App.name,
    :budget => rand(100..10000),
    :delivery_date => Faker::Date.forward(rand(10..20)),
    :contact_name => Faker::Name.name,
    :contact_email => Faker::Internet.email,
    :contact_phone => (Faker::PhoneNumber.subscriber_number + rand(100..300).to_s),
    :status => rand(0..5),
    :description => Faker::Lorem.paragraph(10, false, 10),
    :domain => Faker::Internet.domain_name
    )
    8.times do 
        @project.tasks.create!(
            description: "add #{Faker::Measurement.metric_weight} of #{Faker::Science.element}",
            source: Faker::ProgrammingLanguage.name,
            status: rand(0..2),
            difficulty: rand(0..10),
            project_id: @project.id
            )
    end
    
    8.times do 
        @user.activities.create!(
            description: Faker::Lorem.paragraph,
            time_spent: rand(0..200),
            project_id: @project.id)
    end
end

