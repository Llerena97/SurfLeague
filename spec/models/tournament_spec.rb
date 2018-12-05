require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe Tournament do
    it "is valid with a name, place, initial_date, finish_date" do
      tournament = Tournament.new(
      name: 'Koombea Games',
      place: 'Koombea SAS',
      initial_date: '2018-12-05',
      finish_date: '2018-12-08'
      )
      expect(tournament).to be_valid
    end

    it "is valid when initial_date is equal than finish_date" do
      tournament = Tournament.new(
      name: 'Koombea Games',
      place: 'Koombea SAS',
      initial_date: '2018-12-05',
      finish_date: '2018-12-05'
      )
      expect(tournament).to be_valid
    end

    it "is invalid when initial_date is smaller than today" do
      tournament = Tournament.new(
      name: 'Koombea Games',
      place: 'Koombea SAS',
      initial_date: '2018-12-04',
      finish_date: '2018-12-05'
      )
      expect(tournament).to_not be_valid
    end

    it "is invalid when final_date is smaller than initial_date" do
      tournament = Tournament.new(
      name: 'Koombea Games',
      place: 'Koombea SAS',
      initial_date: '2018-12-15',
      finish_date: '2018-12-12'
      )
      expect(tournament).to_not be_valid
    end    

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:place) }
    it { should validate_presence_of(:initial_date) }
    it { should validate_presence_of(:finish_date) }

  end
end
