require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves new category" do
        expect{
          post :create, params: { category: attributes_for(:category) }
        }.to change(Category, :count).by(1)
      end

      it "redirects to root_path" do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "doesn't save new category" do
        expect{
          post :create, params: { category: {name: ""} }
        }.to_not change(Category, :count)
      end
    end    
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:category){ create(:category, name: "Open board") }
      context "valid attributes" do
        it "updated category name" do
          patch :update, params: { id: category, category: attributes_for(:category) }
          expect(assigns(:category)).to eq(category)
        end

        it "redirects to root_path" do
          patch :update, params: { id: category, category: attributes_for(:category) }
          expect(response).to redirect_to root_path
        end
      end

      context "with invalid attributes" do
        it "does not change the category's attributes" do
          patch :update, params: { id: category, category: attributes_for(:category,
            name: "Open board",
            ) }
          expect(category.name).to eq("Open board")
        end
      end
    end
  end
end
