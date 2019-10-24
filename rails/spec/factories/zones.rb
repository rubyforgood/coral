FactoryBot.define do
  factory :zone do
    name { FFaker::Address.city }
  end
end
