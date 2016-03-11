class Bank < ActiveRecord::Base
  belongs_to :parent
  has_many :children, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :chores, dependent: :destroy

  validates :name, :presence => true

end
