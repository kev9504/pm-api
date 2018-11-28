class Task < ApplicationRecord
  belongs_to :project
  validates_presence_of :project_id, :description
  enum status:[:open, :completed, :canceled]
  before_commit :update_project, except: :destroy #error not letting destroy projects 
  #due to task trying to update it
  
  def update_project
    self.project.update_project
    #not updating when adding activities or tasks
  end
end
