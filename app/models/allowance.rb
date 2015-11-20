class Allowance < ActiveRecord::Base
  belongs_to :account

  validates :amount, :presence => true
end
