class CreateMovesets < ActiveRecord::Migration
  def change
    create_table :movesets do |t|
      t.integer :team_pokemon_id

      t.timestamps
    end
  end
end
