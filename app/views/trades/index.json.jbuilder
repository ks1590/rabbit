json.array! @trades do |trade|
  json.id trade.id
  json.date trade.date
  json.title "#{trade.category.name} : #{number_to_currency(trade.amount)}"
  json.amount trade.amount
  json.note trade.note
  json.update_url trade_path(trade, method: :patch)
  json.edit_url edit_trade_path(trade)
end