class Trade < ApplicationRecord
  validates :event_on, presence: true, length:{ maximum: 10 }
  validates :amount, presence: true, length:{ maximum: 7 }

  belongs_to :user
  belongs_to :payment
  belongs_to :category

  last_month = Date.today.last_month
  current_month = Date.today
  current_year = Date.today.all_year

  month_jan = Date.today.beginning_of_year
  month_feb = month_jan.since(1.months)
  month_mar = month_jan.since(2.months)
  month_apr = month_jan.since(3.months)
  month_may = month_jan.since(4.months)
  month_jun = month_jan.since(5.months)
  month_jul = month_jan.since(6.months)
  month_aug = month_jan.since(7.months)
  month_sep = month_jan.since(8.months)
  month_oct = month_jan.since(9.months)
  month_nov = month_jan.since(10.months)
  month_dec = month_jan.since(11.months)
  
  scope :last_month, -> { where(event_on: last_month.beginning_of_month..last_month.end_of_month) }
  scope :current_month, -> { where(event_on: current_month.beginning_of_month..current_month.end_of_month) }
  scope :current_year, -> { where(event_on: current_year) }
  scope :month_jan, -> { where(event_on: month_jan.beginning_of_month..month_jan.end_of_month) }
  scope :month_feb, -> { where(event_on: month_feb.beginning_of_month..month_feb.end_of_month) }
  scope :month_mar, -> { where(event_on: month_mar.beginning_of_month..month_mar.end_of_month) }
  scope :month_apr, -> { where(event_on: month_apr.beginning_of_month..month_apr.end_of_month) }
  scope :month_may, -> { where(event_on: month_may.beginning_of_month..month_may.end_of_month) }

  def test_sum
    months = [Trade.month_apr,Trade.month_may]
    arr = []
    joins(:category).pluck(:category_id, :name).uniq.sort 

    for item in arry_expense do
      hash_expense[item[1]] = Trade.current_month.where(category_id: item[0]).sum(:amount)
    end
    
    hash_expense.each do |data|
      arr.push(name: data[0], data: data[1])
    end
  end
  

  def self.list_default(owner)
    joins(:payment).joins(:category).where(user_id: owner.id).order(event_on: :desc) 
  end
  
  def self.sort_expense(owner)
    joins(:category).where(user_id: owner.id).pluck(:category_id, :name).uniq.sort    
  end
end
