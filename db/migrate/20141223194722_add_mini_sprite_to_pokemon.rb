class AddMiniSpriteToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :sprite_mini, :string
  end
end
