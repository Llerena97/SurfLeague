class RemoveColumnCategoryOfGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :category_id
  end
end
