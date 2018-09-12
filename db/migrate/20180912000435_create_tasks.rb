class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :project, foreign_key: true
      t.text :body
      t.string :source
      t.string :status
      t.integer :difficulty 
    end
  end
end
