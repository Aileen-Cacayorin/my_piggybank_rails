class Transaction < ActiveRecord::Base
  belongs_to :account

  validates :amount, :presence => true
  validates :transaction_type, :presence => true
  validates :description, :presence => true

  def self.transaction_chart_data(account)
    start_date = account.created_at.to_datetime
    end_date = Date.today
    days = (end_date - start_date).ceil

    (30.day.ago.to_date..Date.today).map do |date|
      { date:  date,
        total:  self.where(:created_at => start_date.beginning_of_day..date.end_of_day).sum(:amount).to_f + account.beginning_balance
      }
    end
  end
end
