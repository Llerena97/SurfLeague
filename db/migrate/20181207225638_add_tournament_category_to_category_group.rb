class AddTournamentCategoryToCategoryGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :category_groups, :tournament_category, foreign_key: true
    remove_index :category_groups, :category_id
    remove_column :category_groups, :category_id, :bigint
  end
end
