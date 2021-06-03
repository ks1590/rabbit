FactoryBot.define do
  factory :trade do
    event_on { '002021/06/10' }
    payment_id { payment.id }
    category_id { category.id}
    amount { 1000 }
    memo { '' }
    user
  end

  factory :second_trade, class: Trade do
    event_on { '002021/06/20' }
    payment_id { payment.id }
    category_id { category.id}
    amount { 2000 }
    memo { 'ランチ＠新宿' }
    user
  end

  factory :third_trade, class: Trade do
    event_on { '002021/06/30' }
    payment_id { payment.id }
    category_id { category.id}
    amount { 3000 }
    memo { 'ディナー＠渋谷' }
    user
  end
end