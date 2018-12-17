class CreateCategoryGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :category_groups do |t|
      t.references :tournament, foreign_key: true
      t.references :category, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
