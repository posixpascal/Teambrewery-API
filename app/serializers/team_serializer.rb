class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :format, :populate_on_creation, :private, :pokemons

  def pokemons
  	res = object.team_pokemons.map {|tp| 
  		k = tp.attributes
  		k[:pokemon] = PokemonSerializer.new(tp.pokemon, {:root => false})
  		k
  	}

  	res


  end
  
end
