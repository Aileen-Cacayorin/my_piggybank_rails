class Transaction < ActiveRecord::Base
  belongs_to :account

  validates :amount, :presence => true
  validates :transaction_type, :presence => true
  validates :description, :presence => true

end
