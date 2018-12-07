class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :tournament_categories
  has_many :tournaments, through: :tournament_categories

  has_many :category_groups
  has_many :groups, through: :category_groups

  has_many :participant_categories
  has_many :participants, through: :participant_categories
  
end
