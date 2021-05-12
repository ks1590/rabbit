class ChangeDescriptionToTrade < ActiveRecord::Migration[5.2]
  def change
    change_column_null :trades, :memo, true
  end
end
