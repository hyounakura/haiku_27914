FactoryBot.define do
  factory :favorite do
    association :user, factory: :user
    association :haiku, factory: :haiku
  end
end