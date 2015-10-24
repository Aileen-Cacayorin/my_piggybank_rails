class RemoveBankIdFromParents < ActiveRecord::Migration
  def change
    remove_column :parents, :bank_id
  end
end
