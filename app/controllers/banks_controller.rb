class BanksController < ApplicationController
  before_action :authenticate_parent!
  before_action :set_default

  def new

    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    @bank.parent = @parent
    if @bank.save
      flash[:success] = "Your bank was created!"
      redirect_to parent_bank_path(@parent, @bank)
    else
      flash[:danger] = "Something went wrong."
      redirect_to :back
    end
  end

  def show
    @bank = Bank.find(params[:id]) || Bank.find(params[:current_parent_id])
    @requests = @bank.parent.requests
  end


  private

  def set_default
    @parent = Parent.find(params[:parent_id])
  end

  def bank_params
    params.require(:bank).permit(:name)
  end

end
