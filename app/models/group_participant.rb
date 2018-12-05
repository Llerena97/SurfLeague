class GroupParticipant < ApplicationRecord
  belongs_to :group
  belongs_to :participant
end
