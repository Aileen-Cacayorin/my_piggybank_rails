class TransactionsController < ApplicationController
    before_action :authenticate_parent!
    before_action :set_default

  def new
    @transaction = Transaction.new
  end

  def create
    if transaction_params[:transaction_type].=="Withdrawal"
      amount = transaction_params[:amount].to_f.abs.*(-1)
    else
      amount = transaction_params[:amount].to_f
    end
    @transaction = Transaction.create(:description =>transaction_params[:description], :transaction_type => transaction_params[:transaction_type], :amount => amount, :bank_id => transaction_params[:bank_id] )
    @transaction.account = @account
    @transaction.save
    if transaction_params[:request_id]
      @request = Request.find(transaction_params[:request_id])
      @request.destroy
      redirect_to :back
    else
      respond_to do |format|
      format.html {redirect_to child_account_path(@account.child, @account)}
      format.js
      end
    end

  end

  def show
  end

private

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :description, :request_id, :bank_id)
  end

  def set_default
    @account = Account.find(params[:account_id])
  end

end
