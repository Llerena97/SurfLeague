class GroupsController < ApplicationController
  before_action :set_tournament

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @tournament
    end
  end

  private

  def group_params
    params.require(:group).permit(
      :name,
      :phase
      )
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

end
