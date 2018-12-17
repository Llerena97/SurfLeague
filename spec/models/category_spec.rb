require 'rails_helper'

RSpec.describe Category, type: :model do
  
  describe Category do
    let(:category){ create(:category) }
    it "returns valid with a name" do
      expect(category).to be_valid
    end

    it "returns invalid without a name" do
      category = Category.new(
      name: '')
      expect(category).to_not be_valid
    end
  end
end
