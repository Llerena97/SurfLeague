class Group < ApplicationRecord
  belongs_to :tournament
  has_many :category_groups
  has_many :categories, through: :category_groups
  has_many :group_participants
  has_many :participants, through: :group_participants

  accepts_nested_attributes_for :category_groups, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :group_participants, reject_if: :all_blank, allow_destroy: true

end
