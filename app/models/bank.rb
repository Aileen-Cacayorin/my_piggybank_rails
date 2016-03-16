class Bank < ActiveRecord::Base
  belongs_to :parent
  has_many :children, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :chores, dependent: :destroy

  validates :name, :presence => true

  def available_chores
    return Chore.where(:bank_id => self.id, :available => true)
  end

  def assigned_chores
    return Chore.where(:bank_id => self.id, :available => false)
  end
end
