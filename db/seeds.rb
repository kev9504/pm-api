PROJECTS = []
2.times do 
    project = {
        :title => Faker::Space.launch_vehicule,
        :budget => rand(100..1000),
        :owner => rand(0..5),
        :delivery_date => Faker::Date.forward(rand(10..20)),
        :contact_name => Faker::Name.name,
        :contact_email => Faker::Internet.email,
        :contact_phone => (Faker::PhoneNumber.subscriber_number + rand(100..300).to_s).to_i,
        :status => rand(0..6)
    }
    PROJECTS << project
    puts 'project created'
end

PROJECTS.each do |project|
    @project = Project.create!(project)
    puts 'project created in the database' if @project
end