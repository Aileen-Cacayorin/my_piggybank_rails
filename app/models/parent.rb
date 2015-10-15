class Parent < ActiveRecord::Base
  has_one :bank



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
