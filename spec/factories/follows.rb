FactoryBot.define do
  factory :follow do
    association :following, factory: :user
    association :followed, factory: :user
  end
end