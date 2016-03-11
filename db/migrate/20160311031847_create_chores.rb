class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.integer :bank_id
      t.integer :child_id
      t.string :description
      t.decimal :pay, precision: 10, scale: 2
      t.boolean :available, :default => true;
      t.boolean :complete, :default => false;
      t.boolean :paid, :default => false;
    end
  end
end
