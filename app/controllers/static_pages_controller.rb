class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
    respond_to do |format|
      format.html
      format.js
    end
  end
end
