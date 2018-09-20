PROJECT_OWNERS = []
OTHER_USERS = []

2.times do 
    user = {
        name: Faker::Internet.username,
        email: Faker::Internet.email, 
        password: 'secret'
    }
    PROJECT_OWNERS << user
end

PROJECT_OWNERS.each do |user|
    @user = User.create!(user)
    2.times do 
        @project = @user.projects.create!(
        :title => Faker::Space.launch_vehicule,
        :budget => rand(100..1000),
        :delivery_date => Faker::Date.forward(rand(10..20)),
        :contact_name => Faker::Name.name,
        :contact_email => Faker::Internet.email,
        :contact_phone => (Faker::PhoneNumber.subscriber_number + rand(100..300).to_s).to_i,
        :status => rand(0..5),
        :description => Faker::HitchhikersGuideToTheGalaxy.quote,
        :owner => @user.id
        )
        4.times do 
            @project.tasks.create!(
                description: "add #{Faker::Measurement.metric_weight} of #{Faker::Science.element}",
                source: Faker::ProgrammingLanguage.name,
                status: rand(0..2),
                difficulty: rand(0..10)
                )
        end
    end
end
puts 'projects and tasks created'

10.times do 
    user = {
        name: Faker::Internet.username,
        email: Faker::Internet.email, 
        password: 'secret'
    }
    OTHER_USERS << user
end
OTHER_USERS.each do |user|
    @user = User.create!(user)
    Project.find(rand(1..2)).users << @user
end
puts 'users added to projects'

Project.all.each do |project|
    5.times do 
        project.users.first.activities.create!(
            description: Faker::FamousLastWords.last_words,
            time_spent: rand(0..60),
            project_id: project.id
            )
    end
end
puts 'added activities to projects'