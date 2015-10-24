class BanksController < ApplicationController
  def new
    @bank = Bank.new
  end
end
