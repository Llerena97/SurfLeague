class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :place
      t.date :initial_date
      t.date :finish_date

      t.timestamps
    end
  end
end
