class AllowancesController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
    @allowance = Allowance.new
  end

  def create
    @account = Account.find(params[:account_id])
    @allowance = Allowance.create(allowance_params)
    @allowance.account = @account
    if @allowance.save
      redirect_to parent_bank_path(current_parent, @account.child.bank)
    else
      redirect_to back
    end
  end


  private
    def allowance_params
      params.require(:allowance).permit(:amount)
    end
end
