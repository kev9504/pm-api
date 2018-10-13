class Task < ApplicationRecord
  belongs_to :project
  validates_presence_of :project_id, :description
  enum status:[:open, :completed, :canceled]
  before_commit :update_project
  
  def update_project
    self.project.update_project
  end
end
