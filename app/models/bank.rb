class Bank < ActiveRecord::Base
  belongs_to :parent
  has_many :children
  has_many :transactions

  validates :name, :presence => true



  # def multichart_data
  #   multichart_children = []
  #   self.children.each do |child|
  #     puts child
  #     if child.account.transactions.any?
  #       puts "if"
  #       multichart_children.push(child)
  #     end
  #   end
  #   return multichart_data
  # end


end
