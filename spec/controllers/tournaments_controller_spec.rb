require 'rails_helper'

RSpec.describe TournamentsController, type: :controller do

  let!(:category) { create(:category) }

  describe 'GET #new' do
    it "assigns a new Tournament to @tournament" do
      get :new
      expect(assigns(:tournament)).to be_a_new(Tournament)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested tournament to @tournament" do
      tournament = create(:tournament, tournament_categories_attributes: [{category_id: category.id, participants_per_group: 4}])
      get :edit, params: { id: tournament }
      expect(assigns(:tournament)).to eq(tournament)
    end

    it "render the :edit template" do
      tournament = create(:tournament, tournament_categories_attributes: [{category_id: category.id, participants_per_group: 4}])
      get :edit, params: { id: tournament }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves new tournament" do
        expect{
          post :create, params: { tournament: attributes_for(:tournament, tournament_categories_attributes: [{category_id: category.id, participants_per_group: 4}]) }
        }.to change(Tournament, :count).by(1)
      end

      it "redirects to tournament" do
        post :create, params: { tournament: attributes_for(:tournament, tournament_categories_attributes: [{category_id: category.id, participants_per_group: 4}]) }
        expect(response).to redirect_to tournament_path(assigns(:tournament))
      end
    end

    context "with invalid attributes" do
      it "doesn't save new tournament" do
        expect{
          post :create, params: { tournament: {name: "invalid_tournament"} }
        }.to_not change(Tournament, :count)
      end

      it "renders #new" do
        post :create, params: { tournament: {name: "invalid_tournament"} }
        expect(response).to render_template :new
      end
    end    
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:tournament) { create(:tournament, name: "Koombea Games", place: "Koombea SAS", 
        tournament_categories_attributes: [{category_id: category.id, participants_per_group: 4}]) }
      context "valid attributes" do
        it "updated tournament name" do
          patch :update, params: { id: tournament, tournament: attributes_for(:tournament) }
          expect(assigns(:tournament)).to eq(tournament)
        end

        it "redirects to tournament" do
          patch :update, params: { id: tournament, tournament: attributes_for(:tournament) }
          expect(response).to redirect_to tournament
        end
      end

      context "with invalid attributes" do
        it "does not change the tournament's attributes" do
          patch :update, params: { id: tournament, tournament: attributes_for(:tournament,
            name: "PES",
            place: nil
            ) }
          expect(tournament.name).to_not eq("PES")
          expect(tournament.place).to eq("Koombea SAS")
        end
      end
    end
  end
end
