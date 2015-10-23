class Parent < ActiveRecord::Base
  has_one :bank

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :presence => true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
