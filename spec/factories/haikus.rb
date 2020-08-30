FactoryBot.define do
  factory :haiku do
    id { 1 }
    kami { '古池や' }
    naka { '蛙飛び込む' }
    simo { '水の音' }
    association :user, factory: :user
  end
end