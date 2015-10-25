class Child < ActiveRecord::Base
  belongs_to :bank

  def email_required?
  false
end

def email_changed?
  false
end


devise :database_authenticatable, :registerable,
       :rememberable, :trackable, :validatable,
       :authentication_keys => [:username]

# def self.find_first_by_auth_conditions(warden_conditions)
#   conditions = warden_conditions.dup
#   if login = conditions.delete(:username)
#      where(conditions).where(["username = :value = lower(:value)", { :value => login }]).first
#   else
#     where(conditions.to_hash).first
#   end
#
# end


end
