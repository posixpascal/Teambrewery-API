class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.float :synergy_level
      t.integer :format_id
      t.timestamps
    end
  end
end
