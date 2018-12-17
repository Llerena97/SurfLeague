class TournamentCategory < ApplicationRecord
  validates :participants_per_group, presence: true
  validates :category_id, uniqueness: { scope: :tournament_id }
  
  belongs_to :tournament
  belongs_to :category
  validates :participants_per_group, presence: true
  validates :category_id, uniqueness: { scope: :tournament_id }
end
