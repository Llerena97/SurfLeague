class Participant < ApplicationRecord
  validates :first_name, :last_name, :gender, :participant_categories, presence: true
  has_many :participant_categories, dependent: :delete_all
  has_many :categories, through: :participant_categories
  has_many :group_participants
  has_many :groups, through: :group_participants
  accepts_nested_attributes_for :participant_categories, reject_if: :all_blank, allow_destroy: true
end
