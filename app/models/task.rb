class Task < ApplicationRecord
  belongs_to :project
  validates_presence_of :project_id, :body
end
