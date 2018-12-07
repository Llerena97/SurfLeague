class GroupsController < ApplicationController
  before_action :set_aux_vars

  def new
    @group = @tournament.groups.build
  end

  def create
    @group = @tournament.groups.build(group_params)
    if @group.save
      redirect_to @tournament
    else
      puts "-------------------------------------------"
      puts @group.errors.to_json
      puts "-------------------------------------------"
    end
  end

  private

  def set_aux_vars
    @tournament = Tournament.find(params[:tournament_id])
    @categories = @tournament.categories
  end

  def group_params
    params.require(:group).permit(
      :name,
      :phase,
      participant_ids: [],
      :category_groups_attributes => [:id, :category_id, :group_id],
      :group_participants_attributes => [:id, :group_id]
      )
  end
end
