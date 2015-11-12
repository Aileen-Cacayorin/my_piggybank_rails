class Bank < ActiveRecord::Base
  belongs_to :parent
  has_many :children
  has_many :transactions

  validates :name, :presence => true




end
