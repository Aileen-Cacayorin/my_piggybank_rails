class ChildrenController < ApplicationController
  def show
    @child = current_child
    @account = @child.account
    if @account
      @transactions = @account.transactions.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
      @requests = @child.requests
      @chart_data = @account.transactions.transaction_chart_data(@account)
    end
  end
end
