class Group < ApplicationRecord
  belongs_to :category
  belongs_to :tournament
  has_many :category_groups
  has_many :categories, through: :category_groups
  has_many :group_participants
  has_many :participants, through: :group_participants
end
