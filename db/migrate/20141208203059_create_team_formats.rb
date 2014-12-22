class CreateTeamFormats < ActiveRecord::Migration
  def change
    create_table :team_formats do |t|
      t.integer :team_id
      t.integer :format_id

      t.timestamps
    end
  end
end
