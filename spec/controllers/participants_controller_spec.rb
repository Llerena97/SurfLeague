require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  let!(:category){ create(:category) }

  describe 'GET #new' do
    it "assigns a new participant to @participant" do
      get :new
      expect(assigns(:participant)).to be_a_new(Participant)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    context "with valid parameters" do
      let(:participant){ create(:participant,
        participant_categories_attributes: [{category_id: category.id}]
        )}
      it "assigns the requested participant to @participant" do
        get :edit, params: { id: participant }
        expect(assigns(:participant)).to eq(participant)
      end

      it "render the :edit template" do
        get :edit, params: { id: participant }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves new participant" do
        expect{
          post :create, params: { participant: attributes_for(:participant, participant_categories_attributes: [{category_id: category.id}]) }
        }.to change(Participant, :count).by(1)
      end

      it "redirects to participants_path" do
        post :create, params: { participant: attributes_for(:participant, participant_categories_attributes: [{category_id: category.id}]) }
        expect(response).to redirect_to participants_path
      end
    end

    context "with invalid attributes" do
      it "doesn't save new participant" do
        expect{
          post :create, params: { participant: {name: "invalid_participant"} }
        }.to_not change(Participant, :count)
      end

      it "render #new" do
        post :create, params: { participant: {name: "invalid_participant"} }
        expect(response).to render_template :new
      end
    end    
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:participant) { create(:participant, participant_categories_attributes: [{category_id: category.id}])}
      context "valid attributes" do
        it "updated participant name" do
          patch :update, params: { id: participant, participant: attributes_for(:participant) }
          expect(assigns(:participant)).to eq(participant)
        end

        it "redirects to root_path" do
          patch :update, params: { id: participant, participant: attributes_for(:participant) }
          expect(response).to redirect_to participants_path
        end
      end

      context "with invalid attributes" do
        it "does not change the participant's attributes" do
          patch :update, params: { id: participant, participant: attributes_for(:participant,
            first_name: "Martha",
            gender: nil
            ) }
          expect(participant.first_name).to_not eq("Martha")
          expect(participant.gender).to eq("F")
        end
      end
    end

  end
end
