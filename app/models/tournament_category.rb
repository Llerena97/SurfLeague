class TournamentCategory < ApplicationRecord
  belongs_to :tournament
  belongs_to :category

  has_many :category_groups
  has_many :groups, through: :category_groups

end
