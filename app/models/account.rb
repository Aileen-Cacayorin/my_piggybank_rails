class Account < ActiveRecord::Base
  belongs_to :child
  has_many :transactions, dependent: :destroy

  validates :beginning_balance, :presence => true

  def total
    self.beginning_balance.to_f + self.transactions.sum(:amount).to_f
  end
end
