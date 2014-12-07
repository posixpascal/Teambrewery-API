class CreateTeamPokemons < ActiveRecord::Migration
  def change
    create_table :team_pokemons do |t|
      t.integer :pokemon_id
      t.integer :evspread
      t.string :nickname
      t.integer :happiness
      t.integer :gender
      t.boolean :shiny
      t.integer :ability_id
      t.integer :item_id

      t.timestamps
    end
  end
end
