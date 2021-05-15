class Payment < ApplicationRecord
  has_many :trades, dependent: :destroy
end
