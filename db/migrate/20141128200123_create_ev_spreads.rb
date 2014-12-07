class CreateEvSpreads < ActiveRecord::Migration
  def change
    create_table :ev_spreads do |t|
      t.integer :team_pokemon_id
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :spa
      t.integer :spd
      t.integer :spe
      t.integer :hp_ivs
      t.integer :atk_ivs
      t.integer :def_ivs
      t.integer :spa_ivs
      t.integer :spd_ivs
      t.integer :spe_ivs

      t.timestamps
    end
  end
end
