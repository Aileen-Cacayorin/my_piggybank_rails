class ChildrenController < ApplicationController
  before_filter :authenticate_child!
  before_filter :child_is_current_child
  def show
    @child = current_child
    @account = @child.account
    if @account
      @transactions = @account.transactions.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
      @requests = @child.requests
      @chart_data = @account.transactions.transaction_chart_data(@account)
    end
  end



  def child_is_current_child
    unless current_child.id == params[:id].to_i
      flash[:danger] = "You may only view your own account."
      redirect_to root_path
    end
  end
end
