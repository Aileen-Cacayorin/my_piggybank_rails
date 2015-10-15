class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
