class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.column(:amount, :decimal, precision: 10, scale: 2)
      t.column(:transaction_type, :string)
      t.column(:description, :string)

      t.timestamps null: false
    end
  end
end
