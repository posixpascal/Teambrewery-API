class CreateMovePokemons < ActiveRecord::Migration
  def change
    create_table :move_pokemons do |t|
      t.integer :move_id
      t.integer :pokemon_id
      t.text :options

      t.timestamps
    end
  end
end
