class Allowance < ActiveRecord::Base
  belongs_to :account

  validates :amount, :presence => true


  def self.deposit_allowance
    Allowance.all.each do |allowance|
      account = allowance.account
      amount = allowance.amount
      transaction_type = "Deposit"
      description = "allowance"
      bank_id = account.child.bank.id.to_i

      @transaction = Transaction.create(:description => description, :transaction_type => transaction_type, :amount => amount, :bank_id => bank_id)

      @transaction.account = account
      @transaction.save
    end
  end
end
