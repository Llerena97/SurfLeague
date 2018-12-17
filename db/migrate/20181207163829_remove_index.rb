class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :groups, :category_id
    remove_index :category_groups, :tournament_id
  end
end
