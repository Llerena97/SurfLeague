class Group < ApplicationRecord
  belongs_to :tournament
  belongs_to :category
  has_many :group_participants
  has_many :participants, through: :group_participants
  validates :name, :phase, :category_id, :group_participants, presence: true
  accepts_nested_attributes_for :group_participants, reject_if: :all_blank, allow_destroy: true
end
