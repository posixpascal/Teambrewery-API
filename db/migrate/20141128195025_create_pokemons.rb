class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :key
      t.integer :pokedex
      t.string :species
      t.integer :basestat_id
      t.integer :typing_id
      t.integer :height
      t.integer :weight
      t.string :color
      t.boolean :mega
      t.string :mega_forme

      t.timestamps
    end
  end
end
