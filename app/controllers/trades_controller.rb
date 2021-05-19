class TradesController < ApplicationController
  before_action :set_trade, only: [:edit, :update, :destroy]

  def index
    @trades = Trade.joins(:payment).joins(:category)
  end
  
  def new
    @trade = Trade.new
  end

  def create
    @trade = current_user.trades.build(trade_params)
    if @trade.save      
    else      
      respond_to do |format|        
        format.js { @status = "fail" }
      end
    end
  end

  def edit
  end

  def update
    if @trade.update(trade_params)
    else      
      respond_to do |format|
        format.html
        format.js { @status = "fail" }
      end
    end
  end

  def destroy
    if @trade.destroy
    else
      respond_to do |format|
        format.js { @status = "fail"}
      end
    end
  end
  
  
  private
  def set_trade
    @trade = Trade.find(params[:id])
  end

  def trade_params
    params.require(:trade).permit(:event_on, :amount, :memo, :payment_id, :category_id)
  end
end
