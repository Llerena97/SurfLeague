class GroupsController < ApplicationController
  before_action :set_aux_vars
  before_action :get_participants, only: [:new, :create]
  load_and_authorize_resource

  def new
    @group = @tournament.groups.build
  end

  def create
    @group = @tournament.groups.create(group_params)
    if @group.save
      redirect_to @tournament
    else
      render 'new'
    end
  end

  private

  def get_participants
    @participants = Participant.all
  end

  def set_aux_vars
    @tournament = Tournament.find(params[:tournament_id])
    @categories = @tournament.categories
  end

  def group_params
    params.require(:group).permit(
      :name,
      :phase,
      :category_id,
      participant_ids: [],
      :group_participants_attributes => [:id, :group_id]
    )
  end
end
