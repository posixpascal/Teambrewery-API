class CreatePokemonAbilities < ActiveRecord::Migration
  def change
    create_table :pokemon_abilities do |t|
      t.integer :ability_id
      t.integer :pokemon_id

      t.timestamps
    end
  end
end
