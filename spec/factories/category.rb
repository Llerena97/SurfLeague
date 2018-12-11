FactoryBot.define do
  factory :category do
    name { "Shortboard#{rand(10000000000)}" }
  end
end