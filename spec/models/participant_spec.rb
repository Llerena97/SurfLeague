require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe Participant do
    let!(:category) { create(:category) }
    let(:participant){ create(:participant, participant_categories_attributes: [{category_id: category.id}]) }
    
    it "returns valid with a first_name, last_name , gender and at least with one category" do
      expect(participant).to be_valid
    end

    it "returns invalid with a first_name, last_name , gender but without category" do
      participant = Participant.new(
        first_name: "Roger",
        last_name: "Federer",
        gender: "M"
        )
      expect(participant).to_not be_valid
    end
  end
end
