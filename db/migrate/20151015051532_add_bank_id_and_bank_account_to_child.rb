class AddBankIdAndBankAccountToChild < ActiveRecord::Migration
  def change
    add_column :children, :bank_id, :integer
    add_column :children, :bank_account_id, :integer
  end
end
