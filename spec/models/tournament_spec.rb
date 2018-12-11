require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe Tournament do
    let!(:category) { create(:category) }
    let(:tournament) { create(:tournament, tournament_categories_attributes: [{category_id: category.id, participants_per_group: 4}]) }

    it "returns valid with a name, place, initial_date, finish_date and at least with one category" do
      expect(tournament).to be_valid
    end

    context "with valid parameters" do
      let(:tournament) { create(:tournament, initial_date: Date.today, finish_date: Date.today, 
        tournament_categories_attributes: [{category_id: category.id, participants_per_group: 4}]) }
      it "returns valid when initial_date is equal than finish_date" do
        expect(tournament).to be_valid
      end
    end

    context "with invalid parameters" do
      let(:tournament) { build(:tournament,
        initial_date: Date.today - 1.days,
        finish_date: Date.today,
        tournament_categories_attributes: [{category_id: category.id, participants_per_group: 4}]
        )}
      it "returns invalid when initial_date is smaller than today" do  
        expect(tournament).to_not be_valid
      end
    end

    context "with invalid parameters" do
      let(:tournament) { build(:tournament,
        initial_date: Date.today,
        finish_date: Date.today - 2.days,
        tournament_categories_attributes: [{category_id: category.id, participants_per_group: 4}]
        )}
      it "returns invalid when final_date is smaller than initial_date" do
        expect(tournament).to_not be_valid
      end
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:place) }
    it { should validate_presence_of(:initial_date) }
    it { should validate_presence_of(:finish_date) }

  end
end
