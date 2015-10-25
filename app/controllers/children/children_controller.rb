class Children < ApplicationController
  def show
    @child = current_child
  end
end
