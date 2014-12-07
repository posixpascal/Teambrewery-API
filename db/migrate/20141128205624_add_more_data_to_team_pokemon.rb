class AddMoreDataToTeamPokemon < ActiveRecord::Migration
  def change
    add_column :team_pokemons, :learnset_id, :integer
    add_column :team_pokemons, :moveset_id, :integer
  end
end
