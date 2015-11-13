class ChildrenController < ApplicationController
  before_action :authenticate_child!
  before_action :child_is_current_child

  def show
    @child = current_child
    @account = @child.account
    @bank = @child.bank
    if @account
      @transactions = @account.transactions.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
      @requests = @child.requests
      @chart_data = @account.transactions.transaction_chart_data(@account)
      respond_to do |format|
        format.html
        format.js
      end
    end
  end


  private
  
  def child_is_current_child
    unless current_child.id == params[:id].to_i
      flash[:danger] = "You may only view your own account."
      redirect_to root_path
    end
  end
end
