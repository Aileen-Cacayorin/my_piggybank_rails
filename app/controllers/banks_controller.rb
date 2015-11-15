class BanksController < ApplicationController
  before_action :set_default
  before_action :authenticate_parent!
  before_action :parent_is_current_parent, except: [:new, :create]

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
    @children = @bank.children
    @requests = @bank.parent.requests
    @chart_children = @children.select {|child| child.account.present? == true}
  end

  private

  def set_default
    @parent = Parent.find(params[:parent_id])
  end

  def bank_params
    params.require(:bank).permit(:name)
  end

  def parent_is_current_parent
    unless current_parent.bank.id == params[:id].to_i
      flash[:danger] = "You may only view your own bank."
      redirect_to root_path
    end
  end

end
