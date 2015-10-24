class AddFieldsToChildrenTable < ActiveRecord::Migration
  def change
    add_column :children, :first_name, :string
    add_column :children, :last_name, :string
    rename_column :children, :email, :username
  end
end
