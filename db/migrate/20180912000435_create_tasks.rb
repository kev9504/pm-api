class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :project, foreign_key: true
      t.text :description
      t.string :source
      t.integer :status, default: 0
      t.integer :difficulty 
    end
  end
end
