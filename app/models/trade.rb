class Trade < ApplicationRecord
  validates :event_on, presence: true, length:{ maximum: 10 }
  validates :amount, presence: true, length:{ maximum: 7 }

  belongs_to :user
  belongs_to :payment
  belongs_to :category

  last_month = Date.today.last_month
  current_month = Date.today
  current_year = Date.today.all_year

  scope :last_month, -> { where(event_on: last_month.beginning_of_month..last_month.end_of_month) }
  scope :current_month, -> { where(event_on: current_month.beginning_of_month..current_month.end_of_month) }
  scope :current_year, -> { where(event_on: current_year) }

  def self.list_default(owner)
    joins(:payment).joins(:category).where(user_id: owner.id).order(event_on: :desc) 
  end
  
  def self.sort_expense(owner)
    joins(:category).where(user_id: owner.id).pluck(:category_id, :name).uniq.sort    
  end
end
