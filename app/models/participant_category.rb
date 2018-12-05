class ParticipantCategory < ApplicationRecord
  belongs_to :participant
  belongs_to :category
end
