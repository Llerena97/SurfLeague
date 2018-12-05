class FixingParticipantsInTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :participants_per_group, :integer
    add_column :tournament_categories, :participants_per_group, :integer
  end
end
