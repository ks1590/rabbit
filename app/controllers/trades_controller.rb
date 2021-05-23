class TradesController < ApplicationController
  before_action :set_trade, only: [:edit, :update, :destroy]

  def index
    @trades = Trade.list_default(current_user)
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
  
  def chart
    @trades = Trade.list_default(current_user)
    @expense_current_month = @trades.current_month.sum(:amount).to_i
    @expense_current_month = @expense_current_month.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')

    months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

    hash_expense = {}
    arry_expense = Trade.current_month.sort_expense(current_user)
    data_expense = []

    for item in arry_expense do
      hash_expense[item[1]] = Trade.current_month.where(category_id: item[0]).sum(:amount)
    end
    
    hash_expense.each do |data|
      data_expense.push(name: data[0], y: data[1])
    end    
    
    @pie_this_month = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "今月の支出<br><br>#{@expense_current_month}円", align: "center", verticalAlign: 'middle' )
      c.series({
        colorByPoint: true,
        data: data_expense
      })      
      c.plotOptions(pie: {        
        innerSize: '80%',
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {          
          format: '{point.name}: {point.percentage:.1f} %',
          enabled: true, 
          distance: 0,
          allowOverlap: false,
          style: {
            color: '#555',               
            textAlign: 'center', 
            textOutline: 0,
          }}
        })   
      c.chart(type: "pie")              
    end

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.lang(thousandsSep: ",",
      numericSymbols: nil)      
      f.colors(["#FF9202", "#FF91AF", "#88CED3", "#393C99", "#3F62C4", "#4587CA", "#B8D808", "#78B45C", "#FFE053"])
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
