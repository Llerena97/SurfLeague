class RemoveColumnCategoryOfGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :category_id, :bigint
    remove_column :category_groups, :tournament_id, :bigint
  end
end
