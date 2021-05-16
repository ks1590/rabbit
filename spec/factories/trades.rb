FactoryBot.define do
  factory :trade do
    event_on { '002021/05/10' }
    payment_id { payment.id }
    category_id { category.id}
    amount { 1000 }
    memo { '' }
  end

  factory :second_trade, class: Trade do
    event_on { '002021/05/20' }
    payment_id { payment.id }
    category_id { category.id}
    amount { 2000 }
    memo { 'ランチ＠新宿' }
  end

  factory :third_trade, class: Trade do
    event_on { '002021/05/30' }
    payment_id { payment.id }
    category_id { category.id}
    amount { 3000 }
    memo { 'ディナー＠渋谷' } 
  end
end