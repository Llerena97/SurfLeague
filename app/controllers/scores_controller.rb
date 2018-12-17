class ScoresController < ApplicationController
  before_action :set_aux_vars
  load_and_authorize_resource

  def new
    @score = Score.new
  end

  def create
    byebug
    @score = Score.new(score_params)
    if @score.save
      redirect_to @tournament
    else
      render 'new'
    end
  end

  private

  def set_aux_vars
    @tournament = Tournament.find(params[:tournament_id])
    @group = @tournament.groups.find(params[:group_id])
  end

  def score_params
    params.require(:score).permit(
      :waves => [],
      :participant_scores_attributes => [:id, :user_id, :group_id, :score_id, :participant_id]
      )
  end

end
