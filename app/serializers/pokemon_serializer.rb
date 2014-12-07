class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :sprite_url, :species, :typing, :random_battle_moves
  attributes :basestats
  attributes :abilities
  attributes :movesets
  
  def movesets
      ms = []
      object.movesets.each do |moveset|
          pokemon_moveset = Hash.new
          pokemon_moveset[:name] = moveset.name
          pokemon_moveset[:description] = moveset.description
          pokemon_moveset[:item] = moveset.items.select(:name, :desc)[0];
          pokemon_moveset[:item][:key] = pokemon_moveset[:item][:name].downcase
          pokemon_moveset[:moves] = moveset.moves.all.map {|i| {:name => i.name, :desc => i.desc, :type => i.type.name }}
          pokemon_moveset[:ev_spread] = moveset.ev_spreads.first() unless moveset.ev_spreads.first.nil?
          pokemon_moveset[:nature] = Nature.find(moveset.nature_id) unless moveset.nature_id.nil?
          ms.push pokemon_moveset
      end
      ms
  end
  
  def random_battle_moves
     object.random_moves.map {|m|
         {
             :name => m.name,
             :type => m.type.name,
             :desc => m.desc
         }
     }
  end
  
  def basestats
     b = Hash.new
     b[:hp] = object.basestat[:hp]
     b[:atk] = object.basestat[:atk]
     b[:def] = object.basestat[:def]
     b[:spa] = object.basestat[:spa]
     b[:spd] = object.basestat[:spd]
     b[:spe] = object.basestat[:spe]
     b
  end
  
  def sprite_url
     "http://localhost:3000/#{object.sprite.url}" 
  end
  
  def abilities
     object.abilities.map {|i| i.name } 
  end
  
  def typing
     object.typing.types.map {|i| i.name } 
  end
end
