FactoryBot.define do
  factory :tournament do
    name { "Tournament" }
    place { "Whatever place" }
    initial_date { Date.today }
    finish_date { Date.today + 5.days }    
  end
end