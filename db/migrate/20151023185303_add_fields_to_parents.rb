class AddFieldsToParents < ActiveRecord::Migration
  def change
    add_column :parents, :first_name, :string
    add_column :parents, :last_name, :string
    add_column :parents, :username, :string
  end
end
