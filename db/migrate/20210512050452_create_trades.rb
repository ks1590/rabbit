class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.date :event_on, null: false
      t.float :amount, null: false
      t.text :memo, null: false
      t.timestamps
    end
  end
end
