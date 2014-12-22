class CreateRandomBattleMoves < ActiveRecord::Migration
  def change
    create_table :random_battle_moves do |t|
      t.integer :move_id
      t.integer :pokemon_id

      t.timestamps
    end
  end
end
