require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe Participant do
    it "is valid with a first_name, last_name and gender" do
      participant = Participant.new(
      first_name: 'Jane',
      last_name: 'Doe',
      gender: 'F'
      )
      expect(participant).to be_valid
    end

    it "is not valid without a first_name, last_name and gender" do
      participant = Participant.new(
      first_name: '',
      last_name: '',
      gender: ''
      )
      expect(participant).to_not be_valid
    end
  end
end
