FactoryBot.define do
  factory :user do    
    name { 'user1' }
    email { 'user1@test.com' }
    password { "123456" }
  end
end
