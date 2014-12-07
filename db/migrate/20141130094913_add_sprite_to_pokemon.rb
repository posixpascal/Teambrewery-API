class AddSpriteToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :sprite, :string
  end
end
