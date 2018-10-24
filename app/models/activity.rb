class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  validates_presence_of :description, :time_spent
  
  before_commit :update_project
  
  private
  def update_project
    self.project.update_project
  end
  def username
    self.user.email
  end
end
