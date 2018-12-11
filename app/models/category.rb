class Category < ApplicationRecord
  has_many :groups
  has_many :tournament_categories
  has_many :tournaments, through: :tournament_categories
  has_many :participant_categories
  has_many :participants, through: :participant_categories 
  validates :name, presence: true, uniqueness: true
end
