FactoryBot.define do
  factory :restoration_activity_log_entry do
    cleaned { FFaker::Boolean.random }
    corals_added  { rand(0..100) }
    dead_corals { rand(0..100) }
    bleached_corals { rand(0..100) }
  end
end
