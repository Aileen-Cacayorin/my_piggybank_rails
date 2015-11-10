class RequestsController < ApplicationController
  before_filter :authenticate_child!
  def new
    @request = Request.new
    @child = Child.find(params[:child])
    @parent = Parent.find(params[:parent])
  end

  def create
    @request = Request.create(request_params)
    @child = Child.find(request_params[:child_id])
    @bank = @child.bank
    respond_to do |format|
    format.html {redirect_to bank_child_path(@bank, @child)}
    format.js
    end
  end

  def destroy
      @request = Request.find(params[:id])
      @request.destroy
      redirect_to :back
  end

private
  def request_params
    params.require(:request).permit(:amount, :request_type, :description, :parent_id, :child_id)
  end
end
