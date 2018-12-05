class CategoryGroup < ApplicationRecord
  belongs_to :tournament
  belongs_to :category
  belongs_to :group
end
