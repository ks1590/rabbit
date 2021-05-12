class TradesController < ApplicationController
  def index
    @trades = Trade.joins(:payment).joins(:category)
  end
  
  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.create(trade_params)
    if @trade.save      
    else      
      respond_to do |format|        
        format.js { @status = "fail" }
      end
    end
  end

  def edit
  end

  private
  def trade_params
    params.require(:trade).permit(:event_on, :amount, :memo, :payment_id, :category_id)
  end
end
