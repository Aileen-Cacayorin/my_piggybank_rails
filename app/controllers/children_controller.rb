class ChildrenController < ApplicationController
  def show
    @child = current_child
  end
end
