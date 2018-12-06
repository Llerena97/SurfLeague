class CreateParticipantCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_categories do |t|
      t.references :participant, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
