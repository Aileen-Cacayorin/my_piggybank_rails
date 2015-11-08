module TransactionsHelper
  def transaction_chart_data
    (2.weeks.ago.to_date..Date.today).map do |date|
      [ date,
        @transactions.where("date(created_at) = ?", date).sum(:amount).to_f
      ]  

    end
  end
end
