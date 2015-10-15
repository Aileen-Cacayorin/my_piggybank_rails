class Child < ActiveRecord::Base
  belongs_to :bank
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
