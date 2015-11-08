class AccountsController < ApplicationController
  def new
    @child = Child.find(params[:child_id])
    @account = Account.new
  end

  def create
    @child = Child.find(params[:child_id])
    @parent = @child.bank.parent
    @account = Account.create(account_params)
    @account.child = @child
    @account.save
    respond_to do |format|
    format.html { redirect_to parent_bank_path(@parent, @bank)}
    format.js
    end
  end

  def show
    @child = Child.find(params[:child_id])
    @account = Account.find(params[:id])
    @transactions = @account.transactions.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @chart_data = @account.transactions.transaction_chart_data
    binding.pry
  end

  private

  def account_params
    params.require(:account).permit(:beginning_balance)
  end


end
