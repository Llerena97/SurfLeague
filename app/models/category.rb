class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :tournament_categories
  has_many :tournaments, through: :tournament_categories
end
