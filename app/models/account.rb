class Account < ActiveRecord::Base
  belongs_to :child 

  validates :beginning_balance, :presence => true
end
