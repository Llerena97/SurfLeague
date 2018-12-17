class Score < ApplicationRecord
  validate :waves_participant
  has_many :participant_scores
  has_many :participants, through: :participant_scores
  accepts_nested_attributes_for :participant_scores, reject_if: :all_blank, allow_destroy: true

  def waves_participant
    
  end
end
