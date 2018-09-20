class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      
      t.string :title
      t.integer :budget
      t.integer :owner 
      t.date :delivery_date 
      t.string :contact_name 
      t.string :contact_email
      t.integer :contact_phone
      t.integer :status, default: 0
      t.text :description
      t.text :code

      t.timestamps
    end
  end
end
