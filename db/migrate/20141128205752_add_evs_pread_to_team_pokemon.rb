class AddEvsPreadToTeamPokemon < ActiveRecord::Migration
  def change
    add_column :team_pokemons, :ev_spread_id, :integer
  end
end
