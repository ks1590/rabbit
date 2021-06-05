password = "123456"

payment = [
  "電子マネー",
  "QRコード",
  "現金",
  "クレジットカード",
  "デビットカード",
  "口座振替"
]

category = [
  "食費",
  "外食",
  "携帯電話",
  "インターネット",
  "WEBサービス",
  "コンテンツ",
  "メディア",
  "買い物",
  "衣服",
  "電化製品",
  "美容",
  "消耗品",
  "学習",
  "交通",
  "車関連",
  "医療・健康",
  "水道光熱費",
  "住宅",
  "子供",
  "金融サービス",
  "投資",
  "返済",
  "税金",
  "未定"
]

6.times do |n|
  Payment.create!(
    name: payment[n]
  )
end

24.times do |n|
  Category.create!(
    name: category[n]
  )
end

start_date = Date.parse("2021/01/01")
end_date = Date.parse("2021/06/30")
payment_name = [1, 2, 3, 4, 5, 6]
category_name = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 ,21, 22, 23, 24]

1000.times do |n|
  month_name = Random.rand(start_date .. end_date)
  month = month_name
  payment = payment_name.sample
  category = category_name.sample
  amount = Faker::Number.within(range: 100..20000)

  Trade.create!(
    event_on: month,
    payment_id: payment,
    category_id: category,
    amount: amount,
    user_id: 1
  )
end