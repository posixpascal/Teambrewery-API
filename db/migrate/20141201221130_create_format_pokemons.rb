class CreateFormatPokemons < ActiveRecord::Migration
  def change
    create_table :format_pokemons do |t|
      t.integer :pokemon_id
      t.integer :format_id

      t.timestamps
    end
  end
end
