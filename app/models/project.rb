class Project < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_and_belongs_to_many :users
    validates_presence_of [
        :title, 
        :description, 
        :owner, 
        ]
end
