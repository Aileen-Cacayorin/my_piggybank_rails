class AccountsController < ApplicationController
  before_action :set_default
  before_action :authenticate_parent!
  before_action :parent_is_current_parent
  def new

    @account = Account.new
  end

  def create
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
    @account = Account.find(params[:id])
    @transactions = @account.transactions.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @chart_data = @account.transactions.transaction_chart_data(@account)
  end

  private

  def account_params
    params.require(:account).permit(:beginning_balance)
  end

  def set_default
    @child = Child.find(params[:child_id])
  end

  def parent_is_current_parent
    unless current_parent.id == @child.parent.id
      flash[:danger] = "You may only view accounts in your bank."
      redirect_to root_path
    end
  end
end
