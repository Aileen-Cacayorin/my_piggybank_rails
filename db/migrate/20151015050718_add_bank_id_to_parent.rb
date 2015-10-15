class AddBankIdToParent < ActiveRecord::Migration
  def change
    add_column :parents, :bank_id, :integer
  end
end
