class ParticipantCategory < ApplicationRecord
  validates :category_id, presence: true
  validates :participant_id, uniqueness: { scope: :category_id }

  belongs_to :participant
  belongs_to :category
  validates :category_id, presence: true
  validates :participant_id, uniqueness: { scope: :category_id }
end
