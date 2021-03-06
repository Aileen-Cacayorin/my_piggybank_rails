class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :bank

  validates :amount, :presence => true
  validates :transaction_type, :presence => true
  validates :description, :presence => true

  def self.transaction_chart_data(account)
    start_date = account.created_at.to_datetime
    end_date = Date.today
    days = (end_date - start_date).ceil

    (30.day.ago.to_date..Date.today.tomorrow).map do |date|
      { date:  date.in_time_zone,
        total:  self.where(:created_at => 30.day.ago..date.end_of_day).sum(:amount).to_f + account.beginning_balance
      }
    end
  end

  def self.search(search)
    if search != ""
      where('description LIKE ?', "%#{search}%")
    else
     self.all
   end
  end




end
