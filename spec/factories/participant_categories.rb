FactoryBot.define do
  factory :participant_categories do
    association :participant, factory: :participant
    association :category, factory: :category
  end
end