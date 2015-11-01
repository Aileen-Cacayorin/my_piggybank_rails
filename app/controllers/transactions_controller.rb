class TransactionsController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
    @transaction = Transaction.new
  end

  def create
    @account = Account.find(params[:account_id])
      if transaction_params[:transaction_type].=="Withdrawal"
        amount = transaction_params[:amount].to_f.abs.*(-1)
      else
        amount = transaction_params[:amount].to_f
      end
    @transaction = Transaction.create(:description =>transaction_params[:description], :transaction_type => transaction_params[:transaction_type], :amount => amount )
    @transaction.account = @account
    @transaction.save
    respond_to do |format|
    format.html {redirect_to child_account_path(@account.child, @account)}
    format.js
    end

  end


  def show
  end

private
  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :description)
  end
end
