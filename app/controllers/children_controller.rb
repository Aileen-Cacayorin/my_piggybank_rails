class ChildrenController < ApplicationController
  def show
    @child = current_child
    @account = @child.account
    @transactions = @account.transactions
  end
end
