class AddOptionsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :populate_on_creation, :boolean
    add_column :teams, :private, :boolean
    add_column :teams, :tier_id, :integer
  end
end
