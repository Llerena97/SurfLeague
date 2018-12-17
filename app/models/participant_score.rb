class ParticipantScore < ApplicationRecord
  belongs_to :score
  belongs_to :user
  belongs_to :participant
  belongs_to :group
end
