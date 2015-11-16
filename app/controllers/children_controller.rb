class ChildrenController < ApplicationController
  before_action :authenticate_child!, except: [:destroy]
  before_action :child_is_current_child, except: [:destroy]
  before_action :parent_is_child_parent, only: [:destroy]

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

  def destroy
    @child = Child.find(params[:id])
    if @child.destroy
      flash[:success] = "Child deleted from bank."
      redirect_to :back
    else
      flash[:danger] = "Something went wrong. Please try again."
      redirect_to :back
    end
  end


  private

  def child_is_current_child
    unless current_child.id == params[:id].to_i
      flash[:danger] = "You may only view your own account."
      redirect_to root_path
    end
  end

  def parent_is_child_parent
    @child = Child.find(params[:id])
    unless @child.parent.id == params[:parent].to_i
      flash[:danger] = "You may only view your own account."
      redirect_to root_path
    end
  end
end
