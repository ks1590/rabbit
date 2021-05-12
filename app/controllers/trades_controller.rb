class TradesController < ApplicationController
  def index
    @trades = Trade.joins(:payment).joins(:category)
  end
  
  def new
  end
  
  def create
  end

  def edit
  end

end
