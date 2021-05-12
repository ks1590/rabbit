class Trade < ApplicationRecord
  validates :date, presence: true, length:{ maximum: 8 }
  validates :amount, presence: true, length:{ maximum: 7 }
end
