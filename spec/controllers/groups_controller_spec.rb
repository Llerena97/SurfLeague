require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let!(:category) { create(:category) }
  let(:tournament) { create(:tournament, tournament_categories_attributes: [{category_id: category.id, participants_per_group: 2}]) }
  let(:participants) { create_list(:participant, 10, participant_categories_attributes: [{category_id: category.id}]) }

  describe 'GET #new' do
    before do
      get :new, params: { tournament_id: tournament.id }
    end

    it "assigns a new Group to @tournament.groups" do
      expect(assigns(:group)).to be_a_new(Group)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    
    it "saves new group" do
      expect{
        post :create, params: { tournament_id: tournament.id, group: attributes_for(:group, category_id: category.id, 
          participant_ids: [participants.first.id, participants.last.id]) }
      }.to change(Group, :count).by(1)
    end
  end
end
