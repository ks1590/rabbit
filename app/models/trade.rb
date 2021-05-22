class Trade < ApplicationRecord
  validates :event_on, presence: true, length:{ maximum: 10 }
  validates :amount, presence: true, length:{ maximum: 7 }

  belongs_to :user
  belongs_to :payment
  belongs_to :category

  scope :default, -> { order(event_on: :desc)}
end
