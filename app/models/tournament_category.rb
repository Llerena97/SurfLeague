class TournamentCategory < ApplicationRecord
  belongs_to :tournament
  belongs_to :category
end
