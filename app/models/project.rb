class Project < ApplicationRecord
    after_initialize :set_defaults
    
    has_many :tasks, dependent: :destroy
    has_many :activities, dependent: :destroy
    has_and_belongs_to_many :users
    
    validates_presence_of [
        :title, 
        :description, 
        :owner, 
        ]
        
    enum status:[:open, :in_progress, :hold, :delivered, :completed, :canceled]

    def set_defaults
        self.code ||= BCrypt::Password.create(self.id.to_s + self.title)[0..20]
        self.owner ||= 0
    end
    
    def time_spent
        if self.activities
            self.activities.all.sum(:time_spent)
        else
            0
        end
    end
    
    def percentage_completed
        if (self.tasks) && (self.tasks.completed.count > 0)
            completed_tasks = self.tasks.completed.count.to_f
            total_tasks = completed_tasks + self.tasks.open.count.to_f
            completion = completed_tasks/total_tasks
            completion = completion * 100
            
            completion.round(2)
            
        else
            0
        end
    end
    
    def points 
        if self.tasks
            self.tasks.sum(:difficulty)
        else
            0
        end
    end
    
    def update_project
        self.updated_at = Time.now
    end
end
