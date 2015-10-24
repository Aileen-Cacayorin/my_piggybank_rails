class Child < ActiveRecord::Base
  belongs_to :bank

  def email_required?
  false
end

def email_changed?
  false
end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]
end
