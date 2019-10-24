FactoryBot.define do
  factory :nursery_table do
    capacity { rand(1..500) }
    name { FFaker::Name.name }
    zone_id { 1 }
  end
end
