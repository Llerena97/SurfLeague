class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:edit, :update]

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])    
  end

  def tournament_params
    params.require(:tournament).permit(
      :name,
      :place,
      :initial_date,
      :finish_date,
      :tournament_categories_attributes => [:id, :tournament_id, :category_id, :participants_per_group, :_destroy]
      )
  end
end
