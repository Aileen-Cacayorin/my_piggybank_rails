class ParentsController < ApplicationController
  def index
    @parents = Parent.all
    @parent = Parent.new
  end

  def show
    @parent = Parent.new
  end
end
