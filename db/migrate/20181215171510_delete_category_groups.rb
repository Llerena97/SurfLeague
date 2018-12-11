class DeleteCategoryGroups < ActiveRecord::Migration[5.2]
  def change
    drop_table :category_groups
    add_reference :groups, :category, index: true
  end
end
