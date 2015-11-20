class CreateAllowances < ActiveRecord::Migration
  def change
    create_table :allowances do |t|
      t.integer :account_id
      t.column :amount, :decimal, precision: 10, scale: 2


      t.timestamps null: false
    end
  end
end
