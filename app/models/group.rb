class Group < ApplicationRecord
  belongs_to :tournament
  belongs_to :category
  has_many :group_participants
  has_many :participants, through: :group_participants
  validates :name, :phase, :category_id, :group_participants, presence: true
  accepts_nested_attributes_for :group_participants, reject_if: :all_blank, allow_destroy: true

  validate :limit_participants_per_group

  def limit_participants_per_group
    unless participant_ids.length == tournament.tournament_categories.where(category_id: category.id)[0].participants_per_group
      errors.add(:participant_ids, "number of participants not allowed")
    end
  end
end
