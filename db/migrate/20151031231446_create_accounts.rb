class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :child_id
      t.column :beginning_balance, :decimal, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
