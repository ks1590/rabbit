class ChangeLevelOfPayment < ActiveRecord::Migration[5.2]
  def change
    Payment.create(name:"電子マネー")
    Payment.create(name:"QRコード")
    Payment.create(name:"現金")
    Payment.create(name:"クレジットカード")
    Payment.create(name:"デビットカード")
    Payment.create(name:"口座振替")
  end
end
