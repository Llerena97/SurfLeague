FactoryBot.define do
  factory :tournament_category do
    participants_per_group { 4 }
    association :tournament, factory: :tournament
    association :category, factory: :category
  end
end