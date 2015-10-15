class Bank < ActiveRecord::Base
  belongs_to :parent
  has_many :children
end
