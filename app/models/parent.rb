class Parent < ActiveRecord::Base
  attr_accessor :login

  has_one :bank

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :presence => true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

   def self.find_first_by_auth_conditions(warden_conditions)
     conditions = warden_conditions.dup
     if login = conditions.delete(:login)
       where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
     else
       where(conditions).first
     end
   end
end
