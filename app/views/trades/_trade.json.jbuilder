json.id trade.id
json.date trade.event_on
json.title "#{trade.category.name} : #{number_to_currency(trade.amount)}"
json.update_url trade_path(trade, method: :patch)
json.edit_url edit_trade_path(trade)