class Project < ApplicationRecord
    after_initialize :set_defaults
    before_save :set_defaults
    
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
        self.code = BCrypt::Password.create(self.id)[0..10]
    end
    
    def time_spent
        if self.activities
            self.activities.all.sum(:time_spent)
        else
            0
        end
    end
    
    def percentage_completed
        if self.tasks
            completed_tasks = self.tasks.completed.count
            open_tasks = self.tasks.open.count
            return (completed_tasks * 100) / open_tasks
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

end
