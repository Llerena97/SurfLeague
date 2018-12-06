class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:edit, :update, :destroy]

  def index
    @participants = Participant.all
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to participants_path
    else
      render 'new'
    end
  end

  def update
    if @participant.update(participant_params)
      redirect_to participants_path
    else
      render :edit
    end
  end

  def destroy
    if @participant.destroy
      redirect_to participants_path
    end
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(
      :first_name,
      :last_name,
      :gender,
      :participant_categories_attributes => [:id, :participant_id, :category_id, :_destroy ]
      )
  end

end
