class AddPokemonIdToMoveset < ActiveRecord::Migration
  def change
    add_column :movesets, :pokemon_id, :integer
  end
end
