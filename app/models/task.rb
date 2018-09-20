class Task < ApplicationRecord
  belongs_to :project
  validates_presence_of :project_id, :description
  enum status:[:open, :completed, :canceled]
end
