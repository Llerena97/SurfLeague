class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.text :waves, array: true, default: []

      t.timestamps
    end
  end
end
