password = "123456"

User.create!(
  name: "test_user1",
  email: "test_user1@example.com",
  password: password,
  password_confirmation: password
)

start_date = Date.parse("2021/01/01")
end_date = Date.parse("2021/06/30")
payment_name = [1, 2, 3, 4, 5, 6]
category_name = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

500.times do |n|
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
    user_id: 9
  )
end