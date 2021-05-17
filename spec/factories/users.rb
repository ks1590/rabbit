FactoryBot.define do
  factory :user do    
    name { 'user1' }
    email { 'user1@test.com' }
    password { "123456" }
    password_confirmation { "123456" }
  end

  factory :second_user, class: User do
    name { "user2" }
    email { "user2@test.com" }
    password { "123456" }
    password_confirmation { "123456" }    
  end
end
