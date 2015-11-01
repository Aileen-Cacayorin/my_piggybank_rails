class Account < ActiveRecord::Base
  belongs_to :child
  has_many :transactions

  validates :beginning_balance, :presence => true
end
