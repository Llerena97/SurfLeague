require 'rails_helper'

RSpec.describe Category, type: :model do
  
  describe Category do
    it "is valid with a name" do
      category = Category.new(
      name: 'Amateur')
      expect(category).to be_valid
    end

    it "is not valid without a name" do
      category = Category.new(
      name: '')
      expect(category).to_not be_valid
    end
  end
end
