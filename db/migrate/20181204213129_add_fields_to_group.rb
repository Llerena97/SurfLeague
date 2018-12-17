class AddFieldsToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :name, :string, default: "Group"
    add_column :groups, :phase, :integer, default: 1
  end
end
