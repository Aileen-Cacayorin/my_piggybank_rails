class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_type
      t.string :description
      t.decimal :amount, precision: 10, scale: 2
      t.integer :child_id
      t.integer :parent_id
      t.timestamps null: false
    end
  end
end
