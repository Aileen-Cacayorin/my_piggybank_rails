class Chore < ActiveRecord::Base
  belongs_to :bank
  belongs_to :child
  delegate :parent, to: :bank

  validates :description, :presence => true
  validates :pay, :presence => true

end
