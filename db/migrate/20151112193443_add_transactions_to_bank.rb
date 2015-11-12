class AddTransactionsToBank < ActiveRecord::Migration
  def change
    add_column :transactions, :bank_id, :integer
  end
end
