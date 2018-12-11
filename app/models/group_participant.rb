class GroupParticipant < ApplicationRecord
  belongs_to :group
  belongs_to :participant
  validates :participant_id, presence: true
  validates :participant_id, uniqueness: { scope: :group_id }
  validate :dont_repeat_participant_in_group_category
  validate :participant_category

  def dont_repeat_participant_in_group_category
    category_participants = []
    category = Category.find(group.category_id)
    category.groups.each do |group|
      group.participants.each do |participant|
        category_participants << participant.id
      end
    end
    errors.add(:participants, "Already exists in another group") if category_participants.include?(participant.id)
  end

  def participant_category
    errors.add(:participants, "Participant does not belong to this category") unless participant.categories.pluck(:category_id).include?(group.category_id)
  end
end
