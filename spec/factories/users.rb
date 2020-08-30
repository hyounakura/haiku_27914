FactoryBot.define do
  factory :user do
    sequence(:id) {Faker::Number.number(digits: 1)}
    name { 'taro' }
    email { 'taro@com' }
    password { 'taro12' }
    password_confirmation { 'taro12' }
  end
end