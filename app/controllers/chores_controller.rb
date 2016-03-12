class ChoresController < ApplicationController
  before_action :authenticate_parent!
  before_action :set_default
  before_action :parent_is_current_parent

  def index
  end

  def show
  end

  def new
    @chore = Chore.new
    @bank = Bank.find(params[:bank_id])
  end

  def create
    @chore = Chore.create(chore_params)
    @chore.bank = @bank
    @chore.save
    respond_to do |format|
    format.html { redirect_to parent_bank_path(@parent, @bank)}
    format.js
    end
  end

  def edit
  end

  def  updated
  end

  def destroy
  end

  private
  def chore_params
    params.require(:chore).permit(:description, :pay)
  end

  def set_default
    @bank = Bank.find(params[:bank_id])
    @parent = @bank.parent
  end

  def parent_is_current_parent
    unless current_parent.id == @bank.parent.id
      flash[:danger] = "You may only view accounts in your bank."
      redirect_to root_path
    end
  end


end
