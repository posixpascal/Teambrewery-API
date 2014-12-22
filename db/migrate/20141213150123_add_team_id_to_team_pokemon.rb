class AddTeamIdToTeamPokemon < ActiveRecord::Migration
  def change
    add_column :team_pokemons, :team_id, :integer
  end
end
