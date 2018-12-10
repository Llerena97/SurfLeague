class CategoryGroup < ApplicationRecord
  belongs_to :tournament_category
  belongs_to :group
  
  has_many :group_participants
  has_many :participants, through: :group_participants

end
