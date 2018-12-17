require 'rails_helper'

RSpec.describe Group, type: :model do
  describe Group do
    let!(:category) { create(:category) }
    let(:participants) { create_list(:participant, 3, participant_categories_attributes: [{category_id: category.id}]) }
    let(:tournament) do
      create(:tournament,
        tournament_categories_attributes: [{category_id: category.id, participants_per_group: 3}]
      )
    end
    let(:attributes_without_participants) do
      {
        name: "Group A",
        phase: 1,
        category_id: category.id,
      }
    end
    let(:valid_attributes) do
      attributes_without_participants.merge({ participant_ids: [participants.first.id, participants.second.id, participants.last.id] })
    end
    let(:attributes_invalid_participants_numbers) do
      attributes_without_participants.merge({ participant_ids: [participants.first.id, participants.last.id] })
    end

    context 'when group is valid' do
      it "returns valid with all presence fields" do
        expect(tournament.groups.new(valid_attributes)).to be_valid
      end
    end

    context 'when group is invalid' do
      let(:attributes_without_phase_name) do
        valid_attributes.merge({ name: "", phase: 0 })
      end

      it "returns invalid without participants" do
        expect(tournament.groups.new(attributes_without_participants)).to_not be_valid
      end

      it "returns invalid without a group name and phase" do
        expect(tournament.groups.new(attributes_without_phase_name)).to_not be_valid
      end

      it "returns invalid participants number" do
        expect(tournament.groups.new(attributes_invalid_participants_numbers)).to_not be_valid
      end
    end

  end
end
