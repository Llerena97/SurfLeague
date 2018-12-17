require 'rails_helper'

RSpec.describe Group, type: :model do
  describe Group do
    let!(:category) { create(:category) }
    let(:participants) { create_list(:participant, 10, participant_categories_attributes: [{category_id: category.id}]) }

    before :each do
      @tournament = Tournament.create(
        name: "Test name",
        place: "Test place",
        initial_date: Date.today,
        finish_date: Date.today + 2.days,
        tournament_categories_attributes: [{category_id: category.id, participants_per_group: 2}]
        )
    end

    it "returns valid with all presence fields" do
      group = @tournament.groups.new(
        name: "Group A",
        phase: 1,
        category_id: category.id,
        participant_ids: [participants.first.id, participants.last.id]
        )
      expect(group).to be_valid
    end

    it "returns invalid without participants" do
      group = @tournament.groups.new(
        name: "Group A",
        phase: 1,
        category_id: category.id,
        )
      expect(group).to_not be_valid
    end

    it "returns invalid without a group name and phase" do
      group = @tournament.groups.new(
        name: "",
        phase: 0,
        category_id: category.id,
        participant_ids: [participants.first.id, participants.last.id]
        )
      expect(group).to_not be_valid
    end

  end
end
