class RequestsController < ApplicationController
  def new
    @request = Request.new
    @child = Child.find(params[:child])
    @parent = Parent.find(params[:parent])
  end

  def create
    @request = Request.create(request_params)
    @child = Child.find(request_params[:child_id])
    @bank = @child.bank
    redirect_to bank_child_path(@bank, @child)
  end



private
  def request_params
    params.require(:request).permit(:amount, :request_type, :description, :parent_id, :child_id)
  end
end
