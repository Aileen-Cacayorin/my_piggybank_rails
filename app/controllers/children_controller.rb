class ChildrenController < ApplicationController
  def show
    @child = current_child
    @account = @child.account
    if @account
      @transactions = @account.transactions
      @requests = @child.requests
    end
  end
end
