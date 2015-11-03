class ChildrenController < ApplicationController
  def show
    @child = current_child
    @account = @child.account
    if @account
      @transactions = @account.transactions
    end
  end
end
