class TradesController < ApplicationController
  before_action :set_trade, only: [:edit, :update, :destroy]

  def index    
    @trades = current_user.trades.includes(:category)
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
    @trades = current_user.trades.includes(:category)
    @expense_current_month = @trades.current_month.sum(:amount).to_i.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')

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
      c.title(text: "今月の支出<br><br>#{@expense_current_month}円", align: "center", verticalAlign: "middle" )
      c.series({
        colorByPoint: true,
        data: data_expense
      })
      c.plotOptions(pie: {        
        innerSize: "80%",
        allowPointSelect: true,
        cursor: "pointer",
        dataLabels: {
          format: "{point.name}: {point.percentage:.1f} %",
          enabled: true, 
          distance: 0,
          allowOverlap: false,
          style: {
            color: "#555",               
            textAlign: "center", 
            textOutline: 0,
          }}
        })
      c.chart(type: "pie")
    end
    
    hash_expense = {}
    arry_expense = Trade.last_month.sort_expense(current_user)
    data_expense = []
    
    for item in arry_expense do
      hash_expense[item[1]] = Trade.last_month.where(category_id: item[0]).sum(:amount)
    end
    
    hash_expense.each do |data|
      data_expense.push(name: data[0], y: data[1])
    end
    
    @expense_last_month = @trades.last_month.sum(:amount).to_i.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,') 

    @pie_last_month = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "先月の支出<br><br>#{@expense_last_month}円", align: "center", verticalAlign: "middle" )
      c.series({
        colorByPoint: true,
        data: data_expense
      })
      c.plotOptions(pie: {
        innerSize: "80%",
        allowPointSelect: true,
        cursor: "pointer",
        dataLabels: {     
          format: "{point.name}: {point.percentage:.1f} %",
          enabled: true, 
          distance: 0,
          allowOverlap: false,
          style: {
            color: "#555",
            textAlign: "center", 
            textOutline: 0,
          }}
        })
      c.chart(type: "pie")
    end

    hash_expense = {}
    arry_expense = Trade.current_year.sort_expense(current_user)
    data_expense = []
    
    for item in arry_expense do
      hash_expense[item[1]] = Trade.current_year.where(category_id: item[0]).sum(:amount)
    end
    
    hash_expense.each do |data|
      data_expense.push(name: data[0], y: data[1])
    end
    
    @expense_current_year = @trades.current_year.sum(:amount).to_i.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')  

    @pie_current_year = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "今年の支出<br><br>#{@expense_current_year}円", align: "center", verticalAlign: "middle" )
      c.series({
        colorByPoint: true,
        data: data_expense
      })
      c.plotOptions(pie: {        
        innerSize: "80%",
        allowPointSelect: true,
        cursor: "pointer",
        dataLabels: {          
          format: "{point.name}: {point.percentage:.1f} %",
          enabled: true, 
          distance: 0,
          allowOverlap: false,
          style: {
            color: "#555",     
            align: "center",          
            textAlign: "center", 
            textOutline: 0,
          }}
        })   
      c.chart(type: "pie")              
    end

    months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    expense_months = [Trade.month_jan, Trade.month_feb, Trade.month_mar, Trade.month_apr, Trade.month_may]
    arr = []
    @bar = LazyHighCharts::HighChart.new('column') do |f|
      f.xAxis(categories: months, title: {text: '月'})
      f.yAxis(:stackLabels=>{:enabled=> true},title: {text: '円'})

      for m in expense_months do
        arr.push(m.where(category_id: 1).sum(:amount))
      end
      
      f.series(:name=>'食費',:data=> arr)
      # f.series(:name=>'通信費',:data=>[100, 30, 400, 130, 230, 530, 340, 46,300,300,300,3000 ])
      # f.series(:name=>'交通費',:data=> [3300, 2020, 3220, 5110, 4230, 1302, 1122,3200,3500,300,300,300 ])
      # f.series(:name=>'ファッション',:data=> [3000, 1500, 1220, 4110, 2230, 902, 1522,1200,3100,300,300,300 ])
      # f.series(:name=>'美容',:data=> [3300, 2020, 3220, 5110, 4230, 1302, 1122,3200,300,300,3500,3900 ])
      f.title({ :text=>"月ごとの支出"})
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"normal"},:series=>{:dataLabels=>{:enabled=> true}}})
      f.chart(type: "column",height: 550)
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
