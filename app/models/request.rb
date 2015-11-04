class Request < ActiveRecord::Base
  belongs_to :parent
  belongs_to :child

  validates(:request_type, {:presence => true})
  validates(:amount, {:presence => true})
  validates(:description, {:presence => true})
end
