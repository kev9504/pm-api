class AddDomainToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :domain, :string
  end
end
