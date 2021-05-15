class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_reference :trades, :payment
  end
end
