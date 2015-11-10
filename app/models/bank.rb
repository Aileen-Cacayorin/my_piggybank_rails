class Bank < ActiveRecord::Base
  belongs_to :parent
  has_many :children

  validates :name, :presence => true

end
