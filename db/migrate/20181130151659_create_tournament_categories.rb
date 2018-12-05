class CreateTournamentCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :tournament_categories do |t|
      t.references :tournament, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
