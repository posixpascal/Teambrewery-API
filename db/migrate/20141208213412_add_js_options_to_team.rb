class AddJsOptionsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :options, :text
  end
end
