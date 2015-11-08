class Transaction < ActiveRecord::Base
  belongs_to :account

  validates :amount, :presence => true
  validates :transaction_type, :presence => true
  validates :description, :presence => true

  def self.transaction_chart_data
    (5.day.ago.to_date..Date.today).map do |date|
      { date:  date,
        total:  self.where("date(created_at) = ?", date).sum(:amount).to_f
      }

    end
  end
end
