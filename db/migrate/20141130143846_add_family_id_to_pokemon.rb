class AddFamilyIdToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :family_id, :integer
  end
end
