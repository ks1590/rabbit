class Category < ApplicationRecord
  has_many :trades, dependent: :destroy
end
