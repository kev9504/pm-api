class ProjectSerializer < ActiveModel::Serializer
    
    attributes  :id,
                :title, 
                :budget, 
                :contact_email, 
                :contact_name, 
                :contact_phone,
                :time_spent, 
                :percentage_completed, 
                :description, 
                :status, 
                :points,
                :delivery_date,
                :domain,
                :created_at,
                :code,
                :updated_at
    
    has_many :tasks
    has_many :activities

end
